#!/usr/bin/env bash

JAR="$HOME/lib/java/jdt-language-server-1.6.0-202111261512/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"

GRADLE_HOME='/usr/bin/gradle' java \
  -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044 \
  -javaagent:$HOME/.local/jars/lombok.jar \
  -Xbootclasspath/a:$HOME/.local/jars/lombok.jar \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.protocol=true \
  -Dlog.level=ALL \
  -Xms1g \
  -Xmx2G \
  -jar $(echo "$JAR") \
  -configuration "$HOME/lib/java/jdt-language-server-1.6.0-202111261512/config_linux" \
  -data "$1" \
  --add-modules=ALL-SYSTEM \
  --add-opens java.base/java.util=ALL-UNNAMED \
  --add-opens java.base/java.lang=ALL-UNNAMED
