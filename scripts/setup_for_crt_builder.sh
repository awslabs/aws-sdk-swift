#!/bin/bash

set -x

swift ./scripts/generatePackageSwift.swift > Package.swift

cat Package.swift
