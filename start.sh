#!/usr/bin/env bash

echo "eula=true" > /$SERVER_HOME/eula.txt

chown -R minecraft.minecraft /$SERVER_HOME/

cd /$SERVER_HOME/
su - minecraft -c 'java -d64 -XX:NewRatio=3 -XX:+UseThreadPriorities -XX:SoftRefLRUPolicyMSPerMB=2048 -XX:CMSInitiatingOccupancyFraction=90 -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:MaxGCPauseMillis=50 -XX:ParallelGCThreads=4 -XX:+UseAdaptiveGCBoundary -XX:-UseGCOverheadLimit -XX:+UseBiasedLocking -XX:SurvivorRatio=8 -XX:TargetSurvivorRatio=90 -XX:MaxTenuringThreshold=15 -oss4M -ss4M -XX:UseSSE=4 -XX:+UseLargePages -XX:+UseCompressedOops -XX:+OptimizeStringConcat -XX:+UseFastAccessorMethods -XX:+AggressiveOpts -jar ${JAR_FILE}'

bash
