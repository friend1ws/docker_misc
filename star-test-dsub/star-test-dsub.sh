#! /bin/bash

dsub \
  --project genomondevel1 \
  --zones asia-northeast1-a \
  --logging "gs://dsub_test/get_vcf_sample_ids.sh/logging" \
  --disk-size 200 \
  --min-cores 6 \
  --min-ram 36 \
  --image friend1ws/star-test-dsub \
  --input INPUT1="gs://rnaseq_cellline/MCF-7/sequence1.txt" \
  --input INPUT2="gs://rnaseq_cellline/MCF-7/sequence2.txt" \
  --input-recursive REFERENCE="gs://rnaseq_cellline/GRCh37.STAR-2.5.2a" \
  --output-recursive OUTPUT_DIR="gs://rnaseq_cellline/dsub-out/MCF-7" \
  --env SAMPLE="MCF-7" \
  --script "star-test-dsub_script.sh"

