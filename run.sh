#!/bin/sh
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann/bdlc-fetch

#############################################################
# remove exiting files in HDFS
sh ./removeFilesFromHDFS.sh

#############################################################
# fetch files from api to local filesystem
sh ./getFilesFromAPI.sh

#############################################################
# store files in HDFS
sh ./storeFilesInHDFS.sh
