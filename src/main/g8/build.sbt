lazy val $name$ = crossProject.crossType(CrossType.Pure).in(file("shared"))
  .settings(name := "$name$", organization := "com.github.benhutchison")
  .settings(scalaVersion := "2.12.4")
  .settings(addCompilerPlugin("org.spire-math" %% "kind-projector" % "0.9.4"))
  .settings(libraryDependencies ++= Seq(
    $libraryDependencies$
  ))
  .settings(scalacOptions ++= Seq(
    "-deprecation",
    "-encoding", "UTF-8",
    "-feature",
    "-unchecked",
    "-Ypartial-unification",
    "-language:_",
    "-Yno-adapted-args",
    "-Ywarn-dead-code",
    "-Ywarn-numeric-widen",
    "-Ywarn-value-discard",
    "-Xfuture",
  ))

lazy val projJS = $name$.js
lazy val projJVM = $name$.jvm

lazy val root = project.in(file(".")).
  aggregate(projJS, projJVM).
  settings(
    skip in publish := true,
  )