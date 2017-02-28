FROM nimmis/java:openjdk-8-jdk
MAINTAINER PrivateHeberg

ENV DEBIAN_FRONTEND noninteractive

ENV JAR_FILE $jar
ENV SERVER_HOME $dir
ENV MAX_RAM $ram

ADD start.sh /start.sh

RUN chmod +x /start.sh
RUN apt-get update && apt-get install -y wget git && apt-get clean all
RUN useradd -s /bin/bash -d $dir -m minecraft

EXPOSE $port

CMD /start.sh