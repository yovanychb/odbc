#!/bin/bash
docker build -t asterisk .
docker run -it --rm --name asterisk -p 5060:5060/udp -p 10000-10010:10000-10010 asterisk
