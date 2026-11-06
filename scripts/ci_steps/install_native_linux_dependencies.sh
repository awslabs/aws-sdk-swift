#!/bin/bash

# Installs native dependencies required to run CI tasks on either
# Ubuntu (with apt) or Amazon Linux 2 (with yum).
# python3 is needed by codegen to compile endpointBdd traits to bytecode.


if [ -x "$(command -v apt)" ]; then
  apt-get update && apt-get install -y libssl-dev python3
else
  yum install -y openssl-devel which python3
fi
