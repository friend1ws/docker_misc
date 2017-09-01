#! /bin/bash

dsub \
  --project genomondevel1 \
  --zones asia-northeast1-a \
  --disk-size 200 \
  --min-cores 6 \
  --min-ram 36 \
  --logging gs://rnaseq_cellline/dsub-out/small_170831/logging \
  --image friend1ws/star-alignment \
  --tasks star-tasks.tsv \
  --script "star-script.sh"

