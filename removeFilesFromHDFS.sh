#!/bin/sh
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann

#############################################################################################################################
# delete the whole unibit.ai directory in HDFS with all its content, show content of /user/${USER}/examples/
hdfs dfs -rm -r /user/bd01/examples/unibitdata
hdfs dfs -ls    /user/bd01/examples/
