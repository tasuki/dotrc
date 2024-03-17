// Round multiples of seconds/minutes/hours/days/weeks/months/years from a start date
//
// Tested working with: Ammonite Repl 2.5.5, Scala 2.13
//
// Basic usage:
// amm ~/.bin/antiversaries.sc --people "Name 2020-02-02" "Another Name 2020-02-20 02:02"
// amm ~/.bin/antiversaries.sc --from "2020-01-01" --till "2100-01-01" --out ical --people "Name 2020-02-02"
//
// Stats for how many times which event occurs
// amm ~/.bin/antiversaries.sc --people "Name 2020-02-02" | tr -s ' ' | cut -d' ' -f4 | sort | uniq -c | sort -n

import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

import scala.util.Try


// data

val icalDTF = DateTimeFormatter.ofPattern("YYYYMMdd'T'Hms")

case class Person(name: String, dob: LocalDateTime)

case class Antiversary(
  name: String,
  length: Long,
  units: String,
  dateTime: LocalDateTime,
) {
  val len = String.format("%,d", length)

  override def toString() = {
    f"$name%15s $len%15s $units%8s  $dateTime"
  }

  def ical() = {
    val icalDateTime = icalDTF.format(dateTime)

    s"""
      |BEGIN:VEVENT
      |DTSTART: $icalDateTime
      |SUMMARY: $name $len $units
      |END:VEVENT
      |""".stripMargin
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
def main(from: Option[String], till: Option[String], out: Option[String], people: Seq[String]) = {
  val fromDate = from.flatMap(readDate).getOrElse(LocalDateTime.now)
  val tillDate = till.flatMap(readDate).getOrElse(LocalDateTime.now.plusYears(100))

  val persons = people.flatMap(readPerson)
  val events = persons.flatMap(antiweirdsaries)
    .filter(withinRange(fromDate, tillDate))
    .sortBy(_.dateTime)

  out match {
    case Some("ical") =>
      print(
      """|BEGIN:VCALENDAR
         |VERSION:2.0
         |PRODID:-//org.tasuki//antiversaries//EN
         |""".stripMargin
         ++ events.map(_.ical()).mkString ++ "END:VCALENDAR\n")
    case _ =>
      events.foreach(println)
  }
}
