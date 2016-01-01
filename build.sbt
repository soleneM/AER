name := "AER"

version := "1.0-SNAPSHOT"

libraryDependencies ++= Seq(
  javaJdbc,
  javaEbean,
  cache,
  javaCore,
  "mysql" % "mysql-connector-java" % "5.1.18",
  "com.typesafe" %% "play-plugins-mailer" % "2.1.0",
  "org.apache.poi" % "poi" % "3.10-FINAL",
  "org.apache.poi" % "poi-ooxml" % "3.10-FINAL",
  "commons-io" % "commons-io" % "2.3"
)     

play.Project.playJavaSettings
