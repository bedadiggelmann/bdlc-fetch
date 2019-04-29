#!/bin/sh
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann/bdlc-fetch

#############################################################
# remove exiting files in HDFS
source ./removeFilesFromHDFS.sh

#############################################################
# fetch files from api to local filesystem
soruce ./getFilesFromAPI.sh

#############################################################
# store files in HDFS
soruce ./storeFilesInHDFS.sh
