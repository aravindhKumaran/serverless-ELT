#!/bin/bash

#remove the old image
docker rmi 709709592475.dkr.ecr.ca-central-1.amazonaws.com/ghactivity:latest
docker rmi ghactivity

#build new custom image
docker build -t ghactivity .

export AWS_PROFILE=default

#push to ecr
aws ecr get-login-password \
    --region ca-central-1 | \
    docker login \
    --username AWS \
    --password-stdin 709709592475.dkr.ecr.ca-central-1.amazonaws.com

docker build -t ghactivity .

docker tag ghactivity:latest \
    709709592475.dkr.ecr.ca-central-1.amazonaws.com/ghactivity:latest

docker push 709709592475.dkr.ecr.ca-central-1.amazonaws.com/ghactivity:latest


#updating lambda function to get latest image
aws lambda update-function-code \
    --function-name ghactivity-data-ingestion \
    --image-uri 709709592475.dkr.ecr.ca-central-1.amazonaws.com/ghactivity:latest