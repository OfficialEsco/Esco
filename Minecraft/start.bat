title Main Server
java -Xmx10G -Xms10G -jar modpack.jar nogui -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSIncrementalMode -XX:+CMSIncrementalPacing -XX:+CMSParallelRemarkEnabled -XX:MaxGCPauseMillis=50 -XX:+DisableExplicitGC -XX:+AggressiveOpts -XX:+UseFastAccessorMethods -XX:+UseBiasedLocking -XX:TargetSurvivorRatio=90
pause