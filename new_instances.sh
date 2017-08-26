#! /bin/bash

gcloud compute instances create savnet-paper3 \
  --zone asia-northeast1-a \
  --machine-type n1-standard-4 \
  --boot-disk-device-name ubuntu-cloud-os
