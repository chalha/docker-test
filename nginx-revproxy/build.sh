#!/bin/bash
docker build --no-cache -t nginx-revproxy:v1 -t nginx-revproxy --rm --force-rm .