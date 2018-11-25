#!/bin/bash

echo "Removing old dist"
rm -fr /build/dist/*
echo "Replacing with new dist"
cp -R /app/weserve-landingpage/dist/* /build/dist

