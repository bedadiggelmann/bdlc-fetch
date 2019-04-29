#!/usr/bin/env bash
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann
#############################################################################################################################
# make the directories in the HDFS
# hdfs dfs -mkdir /user/bd01/examples/unibit
# hdfs dfs -mkdir /user/bd01/examples/unibit.ai/companyprofile/csv
# hdfs dfs -mkdir /user/bd01/examples/unibit.ai/companyprofile/json
# hdfs dfs -mkdir /user/bd01/examples/unibit.ai/historicalstockprice
# hdfs dfs -mkdir /user/bd01/examples/unibit.ai/historicalstockprice/csv
# hdfs dfs -mkdir /user/bd01/examples/unibit.ai/historicalstockprice/json
#############################################################################################################################
hdfs dfs -put unibitdata /user/${USER}/examples/
#############################################################################################################################
# show all the contained files of the unibit.ai directory
hdfs dfs -ls -R /user/bd01/examples/unibitdata
