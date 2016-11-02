#!/bin/bash
#     (C) Copyright IBM Corp. 2016
# 
#     Author: Takeshi Ogasawara, IBM Research - Tokyo
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.

ORG=samtools-2015-08-19
SRC=source
BLD=build
#IP=192.30.252.131
IP=github.com
rm -rf ${ORG}
mkdir -p ${ORG}
rm -rf ${SRC}
mkdir -p ${SRC}

#
echo Download the files
#
cd ${ORG}
git clone git://${IP}/samtools/samtools.git
git clone git://${IP}/samtools/htslib.git
cd ../${SRC}
git clone git://${IP}/t-ogasawara/sam-to-bam.git
cd ../${ORG}/samtools
git checkout 0c5617ecd9c3930024bfcec02ac0796c1abfbd67 >& /dev/null
cd ../htslib
git checkout d75415141386bd7af4a3b0c18ce9c72b58c0895e >& /dev/null
cd ../..

#
echo Create the source files
#
${SRC}/sam-to-bam/patches/run_patch.sh

#
echo Build the program
#
cd ${BLD}/samtools
make samtools
cd ../prefilter
make
cd ../hw_zlib
make
cd ../sort_by_coordinate
make
cd ../samtools
mkdir filter.d accelerator.d
ln -s ${PWD}/../prefilter/lib_pre_filter.so filter.d/
ln -s ${PWD}/../sort_by_coordinate/lib_sort_by_coordinate.so filter.d/
ln -s ${PWD}/../hw_zlib/libz_hw.so accelerator.d/
cp -p ../../source/sam-to-bam/ppc64le/lib_ibm_markdup.so filter.d/
