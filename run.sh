#!/usr/bin/env bash
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann

cd $(dirname $0)

###################################################
# fetch files from api to local filesystem
soruce ./getFilesFromAPI.sh

###################################################
# unzip files in local filesystem
# soruce ./unzipFiles.sh

###################################################
# create directories in HDFS
soruce ./createDirectoriesInHDFS.sh

###################################################
# store files in HDFS
soruce ./storeFilesInHDFS.sh

###################################################
# put the files in HDFS
# soruce ./putFilesInHDFS.sh

###################################################
# remove files from HDFS
# source ./removeFilesFromHDFS.sh
