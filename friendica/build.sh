#!/bin/bash
docker build --no-cache -t httpdrevproxy:v1 -t httprevproxy --rm --force-rm .