#!/usr/bin/env sh

yarn build
cd dist && zip function.zip -r . && mv function.zip ..
