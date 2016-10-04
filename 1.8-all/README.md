OpenShift S2I Builder for Java Docker image
====

This Source-to-Image Builder let's you create projects targetting Java OpenJDK 8 and built with:

* gradle
* maven

> NOTE: If a project has a pom.xml and a build.gradle, maven will take precedence

This builder/runtime s2i image can be used with SpringBoot, Vert.X, Wildfly Swarm, DropWizard and many other microservices frameworks. 

BUILD ENV Options
===

* *GRADLE_ARGS*: Allows you to specify options to pass to gradle (Default: `build`)
* *MAVEN_ARGS*: Allows you to specify options to pass to maven (Default: `install`)
* *BUILD_ARGS*: Allows you to specify options to pass to gradle or maven (will be replaced by `GRADLE_ARGS` or `MAVEN_ARGS`)
* *ARTIFACT_DIR*: Path to find where the jar files are created when build.

RUN ENV Options
===

* *JAVA_OPTS*: Options to pass to `java -jar app.jar ${JAVA_OPTS}`

Defaults
===

If you do not specify any `BUILD_ARGS`, by default the s2i image will use the following:

* Gradle

```
BUILD_ARGS="build"
```

Or the value defined in `GRADLE_ARGS`

* Maven

```
BUILD_ARGS="install"
```

Or the value defined in `MAVEN_ARGS`

--

If you do not specify any `ARTIFACT_DIR`, by default the s2i image will use the following:

* Gradle

```
ARTIFACT_DIR="build/libs"
```

* Maven

```
ARTIFACT_DIR="target"
```

Test in OpenShift
===

* First load all the needed resources in a project.

```
oc import image luiscoms/s2i-java --all
```

* Once the builder s2i-java has been registered, you can create an app with:
    * Instant app already provided as template
    * Using the s2i-java builder image using a regular Git repository

Samples
====

There is a lot of example SpringBoot applications [here](https://github.com/spring-projects/spring-boot/tree/master/spring-boot-samples)