FROM tomcat:7.0.105-jdk8-openjdk-slim
ADD target/sample.war /usr/local/tomcat/webapps/
EXPOSE 8093
CMD ["catalina.sh", "run"]
