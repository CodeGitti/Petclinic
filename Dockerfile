FROM ubuntu:20.04

#Set work directory
WORKDIR /app

#Install dependencies, packages i.e curl, wget
RUN apt-get update && apt-get install -y \
        curl \
        wget \
        software-properties-common

#Install java
RUN apt-get install -y openjdk-11-jdk

#Install maven
RUN apt-get install -y maven

#Set java environmental variables
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

#Download and install Tomcat
ENV tomcat=apache-tomcat-9.0.89
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz
RUN tar -xvzf apache-tomcat-9.0.89.tar.gz

#expose ports
EXPOSE 8082

#copy war file to tomcat.webapps
ADD /var/lib/jenkins/workspace/cicd/target/petclinic.war /app/apache-tomcat-9.0.89/webapps

#Start tomcat server
CMD ["sh", "-c", "sleep 5 && /app/apache-tomcat-9.0.89/bin/startup.sh && tail -f /app/apache-tomcat-9.0.89/logs/catalina.out"]
#CMD ["sh", "-c", "sleep 5 && /app/apache-tomcat-9.0.89/bin/startup.sh"]
#CMD ["sh", "-c", "sleep 50 && /app/apache-tomcat-9.0.89/bin/shutdown.sh"]
