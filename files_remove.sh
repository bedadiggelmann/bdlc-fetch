#!/bin/sh
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann/bdlc-fetch

## ###########################################################
## remove local unibitdata directory if it already exists
rm -rf unibitdata/

#############################################################
# remove hdfs unibitdata directory if it already exists
hdfs dfs -rm -r /user/bd01/examples/unibitdata

#############################################################
# show content of /user/bd01/examples/
hdfs dfs -ls /user/bd01/examples/

