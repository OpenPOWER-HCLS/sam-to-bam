#!/bin/bash

# (C) Copyright IBM Corp. 2016
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

ORG=./samtools-2015-08-19	# where samtools and htslib directories as of 2015-08-19 are
SRC=./source/sam-to-bam/patches	# sam-to-bam diff
DIR=./build			# build dir
rm -rf ${DIR}
mkdir ${DIR}
rsync -aq ${ORG}/samtools ${DIR}/
rsync -aq ${ORG}/htslib ${DIR}/
patch -p2 -d ${DIR} < ${SRC}/samtools.patch
patch -p2 -d ${DIR} < ${SRC}/htslib.patch
patch -p2 -d ${DIR} < ${SRC}/prefilter.patch
patch -p2 -d ${DIR} < ${SRC}/hw_zlib.patch
patch -p2 -d ${DIR} < ${SRC}/sort_by_coordinate.patch
