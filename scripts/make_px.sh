#!/usr/bin/env bash

prefix=cvmfs
num=1
machine_type=n1-highcpu-2
boot_disk_size=100GB
zone=asia-northeast1-b
image=""
image_family=centos-7
image_project=centos-cloud

HELP="Usage: make_px.sh [opt]
  -p <prefix>         Set image prefix (default: $prefix)
  -n <num>            Set image number (default: $num)
  -m <machine-type>   Set machine-type (default: $machine_type)
  -b <boot-disk-size> Set boot-disk-size (default: $boot_disk_size)
  -z <zone>           Set zone (default: $zone)
  -i <image>          Set image (default: $image)
  -f <image-family>   Set image-family (default: $image_family)
  -P <image-project>  Set image-project (default: $image_project)
  -h                  Show this help
"

while getopts p:n:m:b:z:i:f:I:h OPT;do
  ((OPTNUM++))
  case $OPT in
    "p" ) prefix=$OPTARG ;;
    "n" ) num=$OPTARG ;;
    "m" ) machine_type=$OPTARG ;;
    "b" ) boot_disk_size=$OPTARG ;;
    "z" ) zone=$OPTARG ;;
    "i" ) image=$OPTARG ;;
    "f" ) image_family=$OPTARG ;;
    "P" ) image_project=$OPTARG ;;
    "h" ) echo "$HELP" 1>&2; exit ;;
    * ) echo "unknown option: $OPT" 1>&2;echo "$HELP" 1>&2; exit ;;
  esac
done

num=$(printf "%02d" $num)
name=${prefix}-px${num}
image=${image:+--image $image}
image_family=${image_family:+--image-family $image_family}
image_project=${image_project:+--image-project $image_project}

echo $ gcloud compute instances create $name $image $image_family $image_project --zone $zone --machine-type $machine_type --boot-disk-size $boot_disk_size --metadata-from-file startup-script=./startup-px.sh
gcloud compute instances create $name $image $image_family $image_project --zone $zone --machine-type $machine_type --boot-disk-size $boot_disk_size --metadata-from-file startup-script=./startup-px.sh
