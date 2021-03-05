#!/bin/bash

VAR=$(echo "$(git rev-parse --abbrev-ref HEAD)" | sed 's/^/"/' | sed 's/$/"/')
cat Package.swift | sed "s#\(.*ClientRuntime.*\.branch\)(\"master\").*#\1("$VAR")),#" > temp.swift
mv temp.swift Package.swift