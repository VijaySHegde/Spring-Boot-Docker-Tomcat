FROM tomcat:7.0-jdk8
ADD target/sample.war /usr/local/tomcat/webapps/
EXPOSE 8093
CMD ["catalina.sh", "run"]
