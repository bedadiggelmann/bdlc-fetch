#!/bin/sh
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann/bdlc-fetch

## ###########################################################
## push unibitdata folder to HDFS
hdfs dfs -put unibitdata /user/bd01/examples/

## ###########################################################
## show all the contained files of the unibitdata directory
hdfs dfs -ls -R /user/bd01/examples/unibitdata
