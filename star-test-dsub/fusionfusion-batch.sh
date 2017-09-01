#! /bin/bash

dsub \
  --project genomondevel1 \
  --zones asia-northeast1-a \
  --disk-size 200 \
  --min-cores 2 \
  --min-ram 8 \
  --logging gs://rnaseq_cellline/dsub-out/small_170831/logging \
  --image friend1ws/fusionfusion \
  --tasks fusionfusion-tasks.tsv \
  --script "fusionfusion-script.sh"

