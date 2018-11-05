#!/usr/bin/env bash

gcloud compute instances create cvmfs-px01 --metadata-from-file startup-script=./startup-cvmfs-px.sh --zone=asia-northeast1-b --machine-type n1-highcpu-2  --boot-disk-size 100GB
