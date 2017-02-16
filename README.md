# sam-to-bam [![Build Status](https://travis-ci.org/t-ogasawara/sam-to-bam.svg?branch=master)](https://travis-ci.org/t-ogasawara/sam-to-bam) [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
The sam2bam is a high-throughput software tool framework that enables users to significantly speed up pre-processing for next-generation sequencing data, especially on single-node multi-core large-memory systems. The sam2bam provides file format conversion from SAM to BAM, as a basic feature. Additional features such as analyzing, filtering, and converting input data are provided by using plug-in tools, e.g., duplicate marking, which can be attached to sam2bam at runtime.

### PERFORMANCE

<img src="https://raw.githubusercontent.com/t-ogasawara/sam-to-bam/gh-pages/sam2bam_perf2.png" alt="sam2bam ibm_markdup performance" title="sam2bam ibm_markdup performance" width="949px">

### PAPER
Ogasawara T, Cheng Y, Tzeng T-HK (2016) Sam2bam: High-Performance Framework for NGS Data Preprocessing Tools. PLoS ONE 11(11): e0167100. doi:[10.1371/journal.pone.0167100](http://dx.doi.org/10.1371/journal.pone.0167100)

## HOW TO BUILD
1. Download a script
   `wget https://github.com/t-ogasawara/sam-to-bam/raw/master/build.sh`
2. Run it
   `bash build.sh`

## HOW TO RUN
http://t-ogasawara.github.io/sam-to-bam/

