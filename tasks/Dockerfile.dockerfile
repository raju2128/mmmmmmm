---
FROM ubuntu
RUN apt-get update
RUN apt-get install -y openjdk-11-jdk
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.67/bin/apache-tomcat-9.0.67.tar.gz .
RUN tar -xvzf apache-tomcat-9.0.67.tar.gz
RUN mv apache-tomcat-9.0.67/* /opt/tomcat
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]

---
FROM tomcat
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
COPY ./*.war /usr/local/tomcat/webapps/testapp.war
...


