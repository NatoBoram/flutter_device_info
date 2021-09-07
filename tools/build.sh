#!/bin/sh

flutter build appbundle
mv build/app/outputs/bundle/release/app-release.aab ~/Desktop/app.aab
