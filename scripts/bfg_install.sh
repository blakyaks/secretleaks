#!/bin/bash
function get_latest_version() {
    curl -s https://repo1.maven.org/maven2/com/madgag/bfg/ | grep -oP '(?<=href=")[0-9]+(\.[0-9]+)*' | sort -V | tail -n 1
}

latestVersion=$(get_latest_version)
sudo curl -L https://repo1.maven.org/maven2/com/madgag/bfg/$latestVersion/bfg-$latestVersion.jar -o /usr/local/bin/bfg.jar
sudo chmod +x /usr/local/bin/bfg.jar
echo "alias bfg='java -jar /usr/local/bin/bfg.jar'" >> ~/.bashrc
source ~/.bashrc