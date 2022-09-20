#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

kubectl logs -f "$@" | fblog -d
