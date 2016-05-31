#!/bin/bash
set -e

tgt=$(mktemp -d)

mkdir -p $tgt/etc
cp -r . $tgt
cp /data/src/github.com/openshift/origin/_output/local/bin/linux/amd64/oc $tgt/etc
cp -r /data/src/github.com/openshift/origin/etc/kubernetes/ssl $tgt/etc
cp -r /data/src/github.com/openshift/origin/etc/kubernetes/cacerts $tgt/etc
cp -r /data/src/github.com/openshift/origin/etc/kubernetes/kubeconfig $tgt/etc

cp $tgt/Dockerfile.openshift $tgt/Dockerfile

docker build -t tangfeixiong/openshift-webtty:v1.3.0-alpha.1 $tgt

rm -rf $tgt
