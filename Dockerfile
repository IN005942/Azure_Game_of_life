FROM maven:3-jdk-8 as mvn
LABEL author='srinivasulu.annam'
RUN git clone https://github.com/IN005942/Azure_Game_of_life.git && cd game-of-life && mvn clean package

FROM tomcat:8
LABEL author='srinivasulu.annam'
COPY --from=mvn /Azure_Game_of_life/gameoflife-web/target/openmrs.war /usr/local/tomcat/webapps/openmrs.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
