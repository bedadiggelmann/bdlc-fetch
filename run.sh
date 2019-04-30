#!/bin/sh
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann/bdlc-fetch

## ###########################################################
## remove existing files in HDFS
sh ./files_remove.sh

## ###########################################################
## fetch files from api to local filesystem and parse them
sh ./files_fetch-convert.sh

## ###########################################################
## store files in HDFS
sh ./files_push2hdfs.sh
