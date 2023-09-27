#!/bin/bash

mkdir -p dependencies
pip install -r requirements.txt -t dependencies
cd dependencies; zip -r ghactivity.zip .
mv -f ghactivity.zip ..
cd ..
rm -rf dependencies
zip -r ghactivity.zip app

