#!/bin/bash
local_container_id=`docker ps -aqf "name=udemy_store_container"`
docker exec -it $local_container_id bash