#!/bin/sh

flutter build appbundle
mv build/app/outputs/bundle/release/app.aab ~/Desktop/app.aab
