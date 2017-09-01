#! /usr/bin/env python

import sys

sample_conf_file = sys.argv[1]
output_dir = sys.argv[2]

star_ref = "gs://rnaseq_cellline/db/GRCh37.STAR-2.5.2a"
fusionfusion_ref = "gs://rnaseq_cellline/db/GRCh37/GRCh37.fa"


sample2seq = {}
with open(sample_conf_file, 'r') as hin:
    for line in hin:
        F = line.rstrip('\n').split(',')
        sample2seq[F[0]] = [F[1], F[2]]


hout = open("star-tasks.tsv", 'w') 
print >> hout, '\t'.join(["--env SAMPLE", "--input INPUT1", "--input INPUT2", "--input-recursive REFERENCE", "--output-recursive OUTPUT_DIR"])
for sample in sample2seq:
    print >> hout, '\t'.join([sample, sample2seq[sample][0], sample2seq[sample][1], star_ref, output_dir + "/star/" + sample]) 
hout.close()


hout = open("fusionfusion-tasks.tsv", 'w')
print >> hout, '\t'.join(["--env SAMPLE", "--input INPUT", "--input REFERENCE", "--output-recursive OUTPUT_DIR"])
for sample in sample2seq:
    print >> hout, '\t'.join([sample, output_dir + "/star/" + sample + "/" + sample + ".Chimeric.out.sam", fusionfusion_ref, output_dir + "/fusion/" + sample]) 
hout.close()



