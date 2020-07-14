FROM bitnami/tomcat:latest
ADD target/sample.war /usr/local/tomcat/webapps/
EXPOSE 8093
CMD ["catalina.sh", "run"]
