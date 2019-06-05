#!/bin/bash
echo "split nginx log"
docker exec -it ajenti bash -c "/etc/nginx/split_log.sh"
