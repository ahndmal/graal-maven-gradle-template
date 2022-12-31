
### Docs:
- https://graalvm.github.io/native-build-tools/latest/gradle-plugin.html
- https://github.com/graalvm/native-build-tools/tree/master/samples/java-application
- https://www.graalvm.org/latest/reference-manual/native-image/native-code-interoperability/

build native image:

```bash
mvn -Pnative -Dagent package

gradle build
```

build from Jar:
```
javac -d build src/com/example/FILE.java
jar --create --file FILE.jar --main-class com.example.App -C build .
native-image -jae JAR_NAME.jar
```

build from class:
```
javac FILE.java
native-image FILE
```