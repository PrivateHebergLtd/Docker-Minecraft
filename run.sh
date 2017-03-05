#!/usr/bin/env bash
echo "#######################################"
echo "#   PrivateHeberg©   -  Module MC     #"
echo "#######################################"

# On va dans la parti. data
cd /data

# Téléchargement d'une template si elle n'existe pas
if [ ! -e "server.properties" ];then
echo "--- Download template... ---"
if [[ $string =~ .*Spigot.* ]];then
   echo "--- Template Spigot ---"
   wget https://cdn.privateheberg.com/Minecraft/Templates/Spigot.zip && unzip Spigot.zip && rm Spigot.zip
else
   echo "--- Template Vanilla ---"
   wget https://cdn.privateheberg.com/Minecraft/Templates/Vanilla.zip && unzip Vanilla.zip && rm Vanilla.zip
fi
fi

# Téléchargement du jar du serveur
if [ ${VERSION} != "OpenMOD" ];then
echo "--- Download version... ---"
wget https://cdn.privateheberg.com/Minecraft/Versions/${VERSION}.jar && mv ${VERSION}.jar server.jar
fi

# Création des dossiers
[ ! -d /data/backup ] && mkdir /data/backup

echo "eula=true" >> eula.txt

echo "--- Démarrage du serveur ---"
java -d64 -XX:NewRatio=3 -XX:+UseThreadPriorities -XX:SoftRefLRUPolicyMSPerMB=2048 -XX:CMSInitiatingOccupancyFraction=90 -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:MaxGCPauseMillis=50 -XX:ParallelGCThreads=4 -XX:+UseAdaptiveGCBoundary -XX:-UseGCOverheadLimit -XX:+UseBiasedLocking -XX:SurvivorRatio=8 -XX:TargetSurvivorRatio=90 -XX:MaxTenuringThreshold=15 -oss4M -ss4M -XX:UseSSE=4 -XX:+UseLargePages -XX:+UseCompressedOops -XX:+OptimizeStringConcat -XX:+UseFastAccessorMethods -XX:+AggressiveOpts -jar server.jar
