#! /bin/bash

gcloud compute instances create savnet-paper3 --zone asia-northeast1-a --machine-type n1-standard-4 --boot-disk-device-name ubuntu-cloud-os --boot-disk-type pd-ssd --boot-disk-size 200

gcloud compute instances attach-disk savnet-paper3 --disk savnet-paper-bk170826

