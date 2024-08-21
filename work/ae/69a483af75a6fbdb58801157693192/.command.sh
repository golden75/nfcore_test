#!/bin/bash -euo pipefail
[ ! -f  test1_1.fastq.gz ] && ln -sf ERR13362006_1.fastq.gz test1_1.fastq.gz
[ ! -f  test1_2.fastq.gz ] && ln -sf ERR13362006_2.fastq.gz test1_2.fastq.gz
fastp \
    --in1 test1_1.fastq.gz \
    --in2 test1_2.fastq.gz \
    --out1 test1_1.fastp.fastq.gz \
    --out2 test1_2.fastp.fastq.gz \
    --json test1.fastp.json \
    --html test1.fastp.html \
     \
     \
     \
    --thread 6 \
    --detect_adapter_for_pe \
     \
    2> >(tee test1.fastp.log >&2)

cat <<-END_VERSIONS > versions.yml
"NFCORE_NFCORETEST:NFCORETEST:FASTQ_TRIM_FASTP_FASTQC:FASTP":
    fastp: $(fastp --version 2>&1 | sed -e "s/fastp //g")
END_VERSIONS
