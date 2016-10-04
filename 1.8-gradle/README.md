OpenShift S2I Builder for Java Docker image
====

This Source-to-Image Builder let's you create projects targetting Java OpenJDK 8 and built with `gradle`

This builder/runtime s2i image can be used with SpringBoot, Vert.X, Wildfly Swarm, DropWizard and many other microservices frameworks. 

BUILD ENV Options
===

* *GRADLE_ARGS*: Allows you to specify options to pass to gradle (Default: `build`)
* *ARTIFACT_DIR*: Path to find where the jar files are created when build (Default: `build/libs`)

RUN ENV Options
===

* *JAVA_OPTS*: Options to pass to `java -jar app.jar ${JAVA_OPTS}`

Defaults
===

If you do not specify any `GRADLE_ARGS`, by default the s2i image will use the following:

```
GRADLE_ARGS="build"
```

--

If you do not specify any `ARTIFACT_DIR`, by default the s2i image will use the following:

```
ARTIFACT_DIR="build/libs"
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