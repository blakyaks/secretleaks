#!/bin/bash
get_latest_release() {
    curl --silent "https://api.github.com/repositories/119190187/releases/latest" |
    grep '"tag_name":' |
    sed -E 's/.*"([^"]+)".*/\1/'
}

version=$(get_latest_release)
curl -L https://github.com/zricethezav/gitleaks/releases/download/$version/gitleaks_${version:1}_linux_x64.tar.gz --output gitleaks.tar.gz
tar -xzvf gitleaks.tar.gz && rm gitleaks.tar.gz
chmod +x gitleaks
sudo mv gitleaks /usr/local/bin/gitleaks