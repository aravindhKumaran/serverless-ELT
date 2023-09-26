#!/bin/bash

sudo apt update -yqq 

sudo apt install -yqq software-properties-common

sudo add-apt-repository ppa:deadsnakes/ppa -y

sudo apt update -yqq 

sudo apt install -y python3.9 -yqq 

sudo apt-get install python3.9-venv -yqq 

cd /home/ubuntu/github-activity

python3.9 -m venv p39-venv

source p39-venv/bin/activate

pip install -r requirements.txt

