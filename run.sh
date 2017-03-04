#!/usr/bin/env bash
echo "#######################################"
echo "#   PrivateHeberg©   -  Module MC     #"
echo "#######################################"

# On va dans la parti. data
cd /data

# Dossier template pour stocker les dossier de config vanilla
[ ! -d /data/template ] && mkdir /data/template
# Copier les configs pour chaque jeu
wget https://cdn.privateheberg.com/Minecraft/Version/${VERSION}.zip
cp ${VERSION}.jar /data/template/spigot.jar

# Création des dossiers
[ ! -d /data/backup ] && mkdir /data/backup

if [ ! -d /data/game  ] || [ ! -f /data/game ];then
	echo "Aucun fichier de jeu, installation...."
	mkdir -p /data/game
    echo "eula=true" >> eula.txt
fi

echo "--- Démarrage du serveur ---"
cd /data/game && java -d64 -XX:NewRatio=3 -XX:+UseThreadPriorities -XX:SoftRefLRUPolicyMSPerMB=2048 -XX:CMSInitiatingOccupancyFraction=90 -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:MaxGCPauseMillis=50 -XX:ParallelGCThreads=4 -XX:+UseAdaptiveGCBoundary -XX:-UseGCOverheadLimit -XX:+UseBiasedLocking -XX:SurvivorRatio=8 -XX:TargetSurvivorRatio=90 -XX:MaxTenuringThreshold=15 -oss4M -ss4M -XX:UseSSE=4 -XX:+UseLargePages -XX:+UseCompressedOops -XX:+OptimizeStringConcat -XX:+UseFastAccessorMethods -XX:+AggressiveOpts -jar ../template/spigot.jar
