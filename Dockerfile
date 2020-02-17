FROM debian:10

RUN apt-get update && apt-get install -y openjdk-11-jdk git ant
RUN git clone https://github.com/d2rq/d2rq.git

WORKDIR /d2rq
RUN sed --in-place -e 's/source="1.5"/source="1.8"/g'  -e 's/target="1.5"/target="1.8"/g'   build.xml

# error: unmappable character (0xC3) for encoding US-ASCII
RUN sed --in-place -e '/author Hannes/d' src/de/fuberlin/wiwiss/d2rq/server/DatasetDescriptionServlet.java

RUN ant jar
