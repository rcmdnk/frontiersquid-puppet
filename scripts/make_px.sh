#!/usr/bin/env bash

prefix=cvmfs
num=1
ncpu=2
mem=4096
machine_type=n1-highcpu-2
boot_disk_size=100GB
zone=asia-northeast1-b
image=""
image_family=centos-7
image_project=centos-cloud

HELP="Usage: make_px.sh [opt]
  -p <prefix>         Set image prefix (default: $prefix)
  -n <num>            Set image number (default: $num)
  -c <ncpu>           Set number of cpus (default: $ncpu)
  -m <ncpu>           Set meory (default: $mem)
  -M <machine-type>   Set machine-type (default: $machine_type)
  -b <boot-disk-size> Set boot-disk-size (default: $boot_disk_size)
  -z <zone>           Set zone (default: $zone)
  -i <image>          Set image (default: $image)
  -f <image-family>   Set image-family (default: $image_family)
  -P <image-project>  Set image-project (default: $image_project)
  -h                  Show this help
"

while getopts p:n:c:m:M:b:z:i:f:P:h OPT;do
  ((OPTNUM++))
  case $OPT in
    "p" ) prefix=$OPTARG ;;
    "n" ) num=$OPTARG ;;
    "c" ) ncpu=$OPTARG ;;
    "m" ) mem=$OPTARG ;;
    "M" ) machine_type=$OPTARG ;;
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

mem_orig=$mem
mem=$((mem_orig/256*256))
if [ $mem -lt $mem_orig ];then
  mem=$((mem+256))
fi

image=${image:+--image $image}
image_family=${image_family:+--image-family $image_family}
image_project=${image_project:+--image-project $image_project}

echo $ gcloud compute instances create $name $image $image_family $image_project --zone $zone --custom-cpu $ncpu --custom-memory ${mem}MB --boot-disk-size $boot_disk_size --metadata-from-file startup-script=./startup-px.sh
gcloud compute instances create $name $image $image_family $image_project --zone $zone --custom-cpu $ncpu --custom-memory ${mem}MB --boot-disk-size $boot_disk_size --metadata-from-file startup-script=./startup-px.sh
