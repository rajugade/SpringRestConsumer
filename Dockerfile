FROM maven:3.5-jdk-8-alpine as build 

VOLUME /tmp

WORKDIR /code

# Prepare by downloading dependencies
ADD pom.xml /code/pom.xml  
#RUN ["mvn", "dependency:resolve"]
#RUN ["mvn", "verify"]

# Adding source, compile and package into a fat jar
ADD src /code/src
RUN ["mvn", "clean", "install"]

RUN ["ls", "/code/target"]
RUN ["pwd"]
RUN ["ls", "-ltrh", "/code/target/RestConsumer.war"]


From tomcat:8-jre8
MAINTAINER "raju.g1233@gmail.com"
WORKDIR /code

EXPOSE 8080
# Copy to images tomcat path
#RUN ["ls","/code/target"]
#ADD code/target/RestFrameWorkUtility-1.0.0.war /usr/local/tomcat/webapps/
COPY --from=build code/target/RestConsumer.war /usr/local/tomcat/webapps/

RUN ["ls", "/usr/local/tomcat/webapps/"]
#ADD target/RestConsumer.jar RestConsumer.jar
#ENTRYPOINT ["java","-jar","RestConsumer.jar"]
CMD ["catalina.sh", "run"]
#ENTRYPOINT [ "java", "-jar", "/code/target/myspringboot.jar" ]
 

