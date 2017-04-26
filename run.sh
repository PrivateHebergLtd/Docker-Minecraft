#!/usr/bin/env bash
echo "#######################################"
echo "#   PrivateHeberg©   -  Module MC     #"
echo "#######################################"

# On va dans la parti. data
cd /data

# Téléchargement d'une template si elle n'existe pas
if [ ! -e "server.properties" ];then
echo "--- Download template... ---"
if [[ ${VERSION} =~ .*Spigot.* ]];then
   echo "--- Template Spigot ---"
   wget https://cdn.privateheberg.fr/Minecraft/Templates/Spigot.zip && unzip Spigot.zip && rm Spigot.zip
else
   echo "--- Template Vanilla ---"
   wget https://cdn.privateheberg.fr/Minecraft/Templates/Vanilla.zip && unzip Vanilla.zip && rm Vanilla.zip
fi
fi

# Téléchargement du jar du serveur
if [ ${VERSION} != "OpenMOD" ];then
echo "--- Deleting old server.jar... ---"
rm server.jar
echo "--- Download version... ---"
wget https://cdn.privateheberg.fr/Minecraft/Versions/${VERSION}.jar && mv ${VERSION}.jar server.jar
else
if [ ! -e "server.jar" ];then
echo "--- server.jar not found ---"
echo "--- Downloading Spigot 1.8 version ---"
wget https://cdn.privateheberg.fr/Minecraft/Versions/Spigot_1.8.jar && mv Spigot_1.8.jar server.jar
fi
fi

# Création des dossiers
[ ! -d /data/backup ] && mkdir /data/backup

echo "eula=true" >> eula.txt

echo "--- Démarrage du serveur ---"
screen -S Spigot -dm bash -c "java -d64 -XX:NewRatio=3 -XX:+UseThreadPriorities -XX:SoftRefLRUPolicyMSPerMB=2048 -XX:CMSInitiatingOccupancyFraction=90 -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:MaxGCPauseMillis=50 -XX:ParallelGCThreads=4 -XX:+UseAdaptiveGCBoundary -XX:-UseGCOverheadLimit -XX:+UseBiasedLocking -XX:SurvivorRatio=8 -XX:TargetSurvivorRatio=90 -XX:MaxTenuringThreshold=15 -oss4M -ss4M -XX:UseSSE=4 -XX:+UseLargePages -XX:+UseCompressedOops -XX:+OptimizeStringConcat -XX:+UseFastAccessorMethods -XX:+AggressiveOpts -jar server.jar"

