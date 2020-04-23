#!/usr/bin/env bash

if [ ! -d ~/share ]; then
  mkdir ~/share;
fi

sudo mount -t 9p -o trans=virtio,version=9p2000.L vmshare ~/share

