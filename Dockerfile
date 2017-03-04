# ==================
#   MC Dockerfile
#   PrivateHeberg©
# ==================

FROM debian:8
MAINTAINER privateHeberg

# ==== Variables ==== #
ENV SERVER_HOME=""
ENV VERSION=""
# =================== #

# ==== Paquets ==== #
RUN apt-get update &&\
    apt-get install -y zip
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN echo oracle-java8-installer shared/accepted-oracle-licence-v1-1 boolean true | sudo /usr/bin/debconf-set-selections
RUN apt-get update && apt-get -y install oracle-java8-installer
# ================= #

# ==== Timezone ==== #
RUN timedatectl set-timezone Europe/Paris
# ================= #

# ==== Minecraft user ==== #
RUN adduser \
	--disabled-login \
	--shell /bin/bash \
	--gecos "" \
	minecraft
RUN usermod -a -G sudo minecraft
# ==================== #

# ==== Scripts ==== #
COPY run.sh /home/minecraft/run.sh
RUN touch /root/.bash_profile
RUN chmod 777 /home/minecraft/run.sh
RUN mkdir  /data
RUN chown minecraft -R /data && chmod 755 -R /data
# ================= #

# ==== Version ==== #

# ================== #

# ==== Volumes ==== #
VOLUME  /data
WORKDIR /data
# ================= #

ENTRYPOINT ["/home/minecraft/run.sh"]
