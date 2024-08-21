#!/bin/bash -euo pipefail
[ ! -f  test2_1.fastq.gz ] && ln -sf SRR28979523_1.fastq.gz test2_1.fastq.gz
[ ! -f  test2_2.fastq.gz ] && ln -sf SRR28979523_2.fastq.gz test2_2.fastq.gz
fastp \
    --in1 test2_1.fastq.gz \
    --in2 test2_2.fastq.gz \
    --out1 test2_1.fastp.fastq.gz \
    --out2 test2_2.fastp.fastq.gz \
    --json test2.fastp.json \
    --html test2.fastp.html \
     \
     \
     \
    --thread 6 \
    --detect_adapter_for_pe \
     \
    2> >(tee test2.fastp.log >&2)

cat <<-END_VERSIONS > versions.yml
"NFCORE_NFCORETEST:NFCORETEST:FASTQ_TRIM_FASTP_FASTQC:FASTP":
    fastp: $(fastp --version 2>&1 | sed -e "s/fastp //g")
END_VERSIONS
