#!/bin/bash

set -e

case "$GITHUB_REF" in
refs/tags/v*)
    echo "${GITHUB_REF#refs/tags/v}"
    ;;
refs/heads/master)
    curl -s https://www.willuhn.de/products/hibiscus-server/download.php | sed -En 's!.*<a href="releases/hibiscus-server-([^"]+).zip".*!\1!p'
    ;;
*)
    echo >&2 "GITHUB_REF=$GITHUB_REF not set or unknown"
    exit 1
    ;;
esac
