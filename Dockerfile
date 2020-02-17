FROM debian:10

RUN apt-get update && apt-get install -y openjdk-11-jdk git ant curl vim-tiny
RUN git clone https://github.com/d2rq/d2rq.git

WORKDIR /d2rq
RUN sed --in-place -e 's/source="1.5"/source="1.8"/g'  -e 's/target="1.5"/target="1.8"/g'   build.xml

# error: unmappable character (0xC3) for encoding US-ASCII
RUN sed --in-place -e '/author Hannes/d' src/de/fuberlin/wiwiss/d2rq/server/DatasetDescriptionServlet.java

# for some reason if you hide the v5.1 driver, leave this new one in place, run the ./generate-mapping command, then put the v5.1 one back it works
RUN curl -O 'https://cdn.mysql.com//Downloads/Connector-J/mysql-connector-java-8.0.19.tar.gz'
RUN cd lib/db-drivers && tar --strip-components=1  -xaf ../../mysql-connector-java-8.0.19.tar.gz mysql-connector-java-8.0.19/mysql-connector-java-8.0.19.jar

RUN ant jar
