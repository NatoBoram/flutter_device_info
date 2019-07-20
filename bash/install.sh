#!/bin/sh

flutter build apk --split-per-abi
flutter install build/app/outputs/apk/release/app-arm64-v8a-release.apk
