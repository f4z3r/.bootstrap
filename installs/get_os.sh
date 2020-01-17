#!/usr/bin/env bash

KERNEL=$(uname -r)

if [[ $KERNEL == *"generic"* ]]; then
  echo ubuntu
else
  echo arch
fi

