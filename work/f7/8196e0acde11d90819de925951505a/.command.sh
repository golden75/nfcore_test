#!/bin/bash -euo pipefail
printf "%s %s\n" test1_1.fastp.fastq.gz test1_trim_1.gz test1_2.fastp.fastq.gz test1_trim_2.gz | while read old_name new_name; do
    [ -f "${new_name}" ] || ln -s $old_name $new_name
done

fastqc \
    --quiet \
    --threads 6 \
    --memory 10000 \
    test1_trim_1.gz test1_trim_2.gz

cat <<-END_VERSIONS > versions.yml
"NFCORE_NFCORETEST:NFCORETEST:FASTQ_TRIM_FASTP_FASTQC:FASTQC_TRIM":
    fastqc: $( fastqc --version | sed '/FastQC v/!d; s/.*v//' )
END_VERSIONS
