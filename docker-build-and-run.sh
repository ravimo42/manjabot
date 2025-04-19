#!/bin/bash
docker build -t ravimo/manjabot . &&
docker run -d --restart always -v manjabot-data:/home/manjabot ravimo/manjabot
