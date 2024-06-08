FROM openjdk:8
RUN wget -q https://archive.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR_VERSION/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz && \
    tar xf apache-tomcat-$TOMCAT_VERSION.tar.gz -C /opt && \
    rm apache-tomcat-$TOMCAT_VERSION.tar.gz && \
    mv /opt/apache-tomcat-$TOMCAT_VERSION /opt/tomcat
EXPOSE 8082
ADD target/petclinic.war petclinic.war
ENTRYPOINT ["java","-jar","/petclinic.war"]
