#!/bin/bash
docker build -t asterisk .
docker run -it --rm --network host --name asterisk asterisk
