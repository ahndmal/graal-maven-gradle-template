

- https://graalvm.github.io/native-build-tools/latest/gradle-plugin.html
- https://github.com/graalvm/native-build-tools/tree/master/samples/java-application
- https://www.graalvm.org/latest/reference-manual/native-image/native-code-interoperability/

build native image:

```bash
mvn -Pnative -Dagent package

gradle build
```