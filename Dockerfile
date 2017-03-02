# ==================
#   MC Dockerfile
#   PrivateHeberg©
# ==================

FROM nimmis/java:openjdk-8-jdk
MAINTAINER privateHeberg

# ==== Variables ==== #
ENV VERSION=""
# =================== #

# ==== Paquets ==== #
RUN apt-get update
# ================= #

# ==== Steam user ==== #
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
COPY run.sh /home/minecraft/run.sh
# ================== #

# ==== Volumes ==== #
VOLUME  /data
WORKDIR /data
# ================= #

ENTRYPOINT ["/home/minecraft/run.sh"]