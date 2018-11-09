#!/usr/bin/env bash

gcloud compute instances create cvmfs-px01-template --image-family  centos-7 --image-project centos-cloud --metadata-from-file startup-script=./startup-cvmfs-px.sh --zone=asia-northeast1-b --machine-type n1-highcpu-2 --boot-disk-size 100GB
