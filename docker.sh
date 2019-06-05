#!/bin/bash
docker restart ajenti
docker exec -it ajenti /usr/sbin/nginx
docker restart socks5
