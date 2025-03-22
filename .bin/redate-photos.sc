#!/usr/bin/env amm

// Try to beat a Google Photos export into some shape.

// I did not have fun writing this. You shall not have fun reading it.
// Bad metadata in, what do you expect out?

// See also checksums and checksums-remove, useful for filtering out (some of)
// the dupes first. It doesn't work tho, as Google Photos changes your files...

import $ivy.`com.drewnoakes:metadata-extractor:2.19.0`

import java.nio.file.attribute.BasicFileAttributes
import java.nio.file.{Files, Path, Paths}
import java.text.SimpleDateFormat
import java.time.{Instant, LocalDateTime, ZoneId, ZoneOffset}
import java.time.format.DateTimeFormatter
import scala.jdk.CollectionConverters._

import com.drew.imaging.ImageMetadataReader
import com.drew.metadata.exif.ExifSubIFDDirectory
import fansi.{Color, EscapeAttr}

val dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd-HHmm")

def getExifDate(filePath: Path): Option[LocalDateTime] = {
	try {
		val metadata = ImageMetadataReader.readMetadata(filePath.toFile)
		val exifDir = metadata.getFirstDirectoryOfType(classOf[ExifSubIFDDirectory])

		Option(exifDir).flatMap { dir =>
			Option(dir.getDateOriginal).map { date =>
				date.toInstant.atZone(ZoneOffset.UTC).toLocalDateTime
			}
		}
	} catch {
		case _: Exception => None
	}
}

val patterns = List(
	""".*(20\d{2})([01]\d)([0-3]\d).(\d{2})(\d{2}).*""".r,
	""".*(20\d{2})-([01]\d)-([0-3]\d).(\d{2})(\d{2}).*""".r
)


def getFnameDate(filePath: Path): Option[LocalDateTime] = {
	patterns.collectFirst { pattern =>
		filePath.getFileName.toString match {
			case pattern(yyyy, mm, dd, h, m) =>
				LocalDateTime.parse(
					s"${yyyy}-${mm}-${dd}T${h}:${m}:00",
					DateTimeFormatter.ISO_LOCAL_DATE_TIME
				)
		}
	}
}

def getCreatedDate(filePath: Path): LocalDateTime = {
	val attr = Files.readAttributes(filePath, classOf[BasicFileAttributes])
	val creationTime = Instant.ofEpochMilli(attr.creationTime().toMillis)
	LocalDateTime.ofInstant(creationTime, ZoneId.systemDefault())
}

def printFileDetails(color: EscapeAttr, date: LocalDateTime, fileName: String) = {
	println(color(s"${dateFormat.format(date)} - $fileName"))
}

def getMaybeDate(file: Path): Option[(String, LocalDateTime)] = {
	val exifDate = getExifDate(file)
	val fnameDate = getFnameDate(file)
	val createdDate = getCreatedDate(file)
	val fileName = file.getFileName.toString

	(exifDate, fnameDate) match {
		case (Some(ed), _) =>
			//printFileDetails(Color.Green, ed, fileName)
			Some((fileName, ed))
		case (_, Some(fd)) =>
			//printFileDetails(Color.Blue, fd, fileName)
			Some((fileName, fd))
		case _ =>
			//printFileDetails(Color.Red, createdDate, fileName)
			None
	}
}

def toOutDate(item: (String, LocalDateTime)): (String, String) = {
	(item._1, dateFormat.format(item._2))
}

def moveFile(directory: String, from: String, to: String): Unit = {
	val extension = from.split("\\.").lastOption.getOrElse("")
	val toPath: Path = Paths.get(directory, s"$to.$extension")
	val fromPath: Path = Paths.get(directory, from)

	try {
		Files.move(fromPath, toPath)
		println(s"File moved from $from to $to.$extension")
	} catch {
		case e: Exception => println(s"Failed to move file: ${e.getMessage}")
	}
}

@main
def main(directory: String): Unit = {
	val dirPath = Paths.get(directory)

	if (!Files.isDirectory(dirPath)) {
		println(s"$directory is not a valid directory")
		return
	}

	val toCopy = Files.list(dirPath).iterator().asScala.toList
		.sortBy(_.getFileName.toString)
		.flatMap(getMaybeDate).map(toOutDate)
		.sortBy(_._2).groupBy(_._2)
		.view.mapValues({
			case List(one) => List(one)
			case many => many.zipWithIndex.map { case (item, idx) =>
				(item._1, s"${item._2}${('a' + idx).toChar}")
			}
		}).toList.map(_._2).flatten

	toCopy.foreach { case f =>
		moveFile(directory, f._1, f._2)
	}
}
