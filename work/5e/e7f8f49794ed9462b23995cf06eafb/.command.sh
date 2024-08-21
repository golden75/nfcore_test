#!/bin/bash -euo pipefail
printf "%s %s\n" SRR28979523_1.fastq.gz test2_raw_1.gz SRR28979523_2.fastq.gz test2_raw_2.gz | while read old_name new_name; do
    [ -f "${new_name}" ] || ln -s $old_name $new_name
done

fastqc \
    --quiet \
    --threads 6 \
    --memory 10000 \
    test2_raw_1.gz test2_raw_2.gz

cat <<-END_VERSIONS > versions.yml
"NFCORE_NFCORETEST:NFCORETEST:FASTQ_TRIM_FASTP_FASTQC:FASTQC_RAW":
    fastqc: $( fastqc --version | sed '/FastQC v/!d; s/.*v//' )
END_VERSIONS
