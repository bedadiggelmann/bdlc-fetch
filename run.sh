#!/bin/sh
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann

#############################################################
# fetch files from api to local filesystem
soruce ./getFilesFromAPI.sh

#############################################################
# store files in HDFS
soruce ./storeFilesInHDFS.sh

#############################################################
# remove files from HDFS
# source ./removeFilesFromHDFS.sh
