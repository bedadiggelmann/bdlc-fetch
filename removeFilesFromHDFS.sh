#!/bin/sh
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann/bdlc-fetch

#############################################################
# delete the whole unibit.ai directory in HDFS with all its content
hdfs dfs -rm -r /user/bd01/examples/unibitdata

#############################################################
# show content of /user/${USER}/examples/
hdfs dfs -ls /user/bd01/examples/
