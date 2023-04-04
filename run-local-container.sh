#!/bin/bash
scriptsdir=$( (cd $(dirname $0); pwd) )
name="udemy_store_container"
cd $scriptsdir
lbl="centos"

docker build \
  -t /Users/jprosiak/repos/udemy_store_example:main -g $(git rev-parse --short HEAD) \
docker build -f Dockerfile -q -t $name:$lbl
echo udemy_store_container image $name:$lbl
docker run --rm -it --name $name \
    -v "$appdir:/UDEMY_STORE_EXAMPLE/" \
    -p 5050:5050 \
    $name:$lbl
