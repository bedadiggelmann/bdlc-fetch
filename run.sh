#!/usr/bin/env bash
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann

cd$(dirname $0)

###################################################
# fetch files from api to local filesystem
soruce ./getFilesFromAPI.sh

###################################################
# format files for usage with Hive or Spark
source ./formatFiles.sh

###################################################
# store files in HDFS
soruce ./storeFilesInHDFS.sh

###################################################
# remove files from HDFS
# source ./removeFilesFromHDFS.sh
