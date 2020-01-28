#!/bin/bash
docker run -it --rm -v /etc/localtime:/etc/localtime:ro -v "$HOME/.rainbow_oauth":/root/.rainbow_oauth -v "$HOME/.rainbow_config.json":/root/.rainbow_config.json --name rainbowstream jrbenito/rainbowstream
