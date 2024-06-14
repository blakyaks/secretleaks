#!/bin/bash
get_latest_release() {
  curl --silent "https://api.github.com/repos/trufflesecurity/trufflehog/releases/latest" |
  grep '"tag_name":' |
  sed -E 's/.*"([^"]+)".*/\1/'
}

version=$(get_latest_release)
curl -L https://github.com/trufflesecurity/trufflehog/releases/download/$version/trufflehog_${version:1}_linux_amd64.tar.gz --output trufflehog.tar.gz
tar -xzvf trufflehog.tar.gz && rm trufflehog.tar.gz
chmod +x trufflehog
sudo mv trufflehog /usr/local/bin/trufflehog