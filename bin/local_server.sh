#!/usr/bin/env bash
docker run --rm -ti -v $PWD:/docs -p 8000:8000 squidfunk/mkdocs-material serve --dev-addr=0.0.0.0:8000
