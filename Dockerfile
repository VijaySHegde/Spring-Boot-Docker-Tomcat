FROM tomcat:8-jre8 
ADD target/sample.war /usr/local/tomcat/webapps/
EXPOSE 8093
CMD ["catalina.sh", "run"]
