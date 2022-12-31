build:
	mvn clean package
    mvn -Pnative -Dagent exec:exec@java-agent
	mvn -Pnative -Dagent package
