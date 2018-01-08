import commondeps.Dependencies._

val vAll = Versions(versions, libraries, scalacPlugins)


lazy val $name$ = crossProject.crossType(CrossType.Pure).in(file("shared"))
  .settings(name := "$name$", organization := "com.github.benhutchison")
  .settings(scalaVersion := vAll.vers("scalac"))
  .settings(addCompilerPlugins(vAll, "kind-projector"))
  .settings(addLibs(vAll,
    $libraryDependencies$
  ))
  .settings(scalacOptions ++= scalacAllOptions)

lazy val projJS = $name$.js
lazy val projJVM = $name$.jvm

lazy val $name$Root = project.in(file(".")).
  aggregate(projJS, projJVM).
  settings(noPublishSettings)