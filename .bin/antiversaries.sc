// Round multiples of seconds/minutes/hours/days/weeks/months/years from a start date
//
// Tested working with: Ammonite Repl 2.3.8 (Scala 2.13.3 Java 11.0.10)
//
// Basic usage:
// amm ~/.bin/antiversaries.sc --people "Name 2020-02-02" "Another Name 2020-02-20 02:02"
//
// Stats for how many times which event occurs
// amm ~/.bin/antiversaries.sc --people "Name 2020-02-02" | tr -s ' ' | cut -d' ' -f4 | sort | uniq -c | sort -n

import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

import scala.util.Try


// data

case class Person(name: String, dob: LocalDateTime)

case class Antiversary(
  name: String,
  length: Long,
  units: String,
  dateTime: LocalDateTime,
) {
  override def toString() = {
    val len = String.format("%,d", length)
    f"$name%15s $len%15s $units%8s  $dateTime"
  }
}


// functions

def antiweirdsaries(person: Person): Seq[Antiversary] = {
  def processOne(person: Person)(
    unit: String,
    anties: IndexedSeq[Double],
    method: (Long => LocalDateTime),
  ): Seq[Antiversary] = {
    anties.map(anti => Antiversary(
      person.name,
      anti.toLong,
      unit,
      method(anti.toLong),
    )).toSeq
  }

  val dob = person.dob

  Seq(
    ("seconds", (1 to 100).map(_ * 1E8), dob.plusSeconds _), // 316 years
    ("minutes", (1 to 100).map(_ * 1E6), dob.plusMinutes _), // 190 years
    ("hours"  , (1 to 100).map(_ * 1E4), dob.plusHours   _), // 228 years
    ("days"   , (1 to 100).map(_ * 1E3), dob.plusDays    _), // 273 years
    ("weeks"  , (1 to 100).map(_ * 1E2), dob.plusWeeks   _), // 191 years
    ("months" , (1 to  20).map(_ * 1E2), dob.plusMonths  _), // 166 years
    ("years"  , (1 to 200).map(_ * 1E0), dob.plusYears   _), // 200 years
  )
  .flatMap(Function.tupled(processOne(person)))
  .sortBy(_.dateTime)
}

val dateFormat =
  """(\d{4})-(\d{1,2})-(\d{1,2})( (\d{1,2}):(\d{1,2}))?"""

val dateRegex = dateFormat.r

val personRegex =
  s"""(.*) $dateFormat""".r

def intOrZero(maybeNum: String): Int =
  Try(maybeNum.toInt).toOption.getOrElse(0)

def readPerson(dob: String): Option[Person] =
  dob match {
    case personRegex(name, year, month, day, _, hours, minutes) =>
      Some(Person(name, LocalDateTime.of(
        intOrZero(year),
        intOrZero(month),
        intOrZero(day),
        intOrZero(hours),
        intOrZero(minutes),
      )))
    case other =>
      // throw new Exception(s"Sorry, did not understand $other")
      None
  }

def readDate(date: String): Option[LocalDateTime] =
  date match {
    case dateRegex(year, month, day, _, hours, minutes) =>
      Some(LocalDateTime.of(
        intOrZero(year),
        intOrZero(month),
        intOrZero(day),
        intOrZero(hours),
        intOrZero(minutes),
      ))
    case other =>
      None
  }

def withinRange(from: LocalDateTime, till: LocalDateTime)(anv: Antiversary): Boolean =
  anv.dateTime.isAfter(from) && anv.dateTime.isBefore(till)

@main
def main(from: Option[String], till: Option[String], people: String*) = {
  val fromDate = from.flatMap(readDate).getOrElse(LocalDateTime.now)
  val tillDate = till.flatMap(readDate).getOrElse(LocalDateTime.now.plusYears(100))

  val persons = people.flatMap(readPerson)
  persons.flatMap(antiweirdsaries)
    .filter(withinRange(fromDate, tillDate))
    .sortBy(_.dateTime)
    .foreach(println)
}
