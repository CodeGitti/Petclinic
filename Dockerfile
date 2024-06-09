FROM openjdk:8
# Install dependencies
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz
RUN tar -xvzf apache-tomcat-9.0.89.tar.gz # unzipping the tomcat
EXPOSE 8082
CMD ["catalina.sh", "run"]
ENTRYPOINT ["java","-jar","/petclinic.war"]
