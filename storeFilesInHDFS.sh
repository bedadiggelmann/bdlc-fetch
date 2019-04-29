#!/usr/bin/env bash
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann
#############################################################################################################################
# make the directories in the HDFS
hdfs dfs -mkdir /user/bd01/examples/unibit.ai
hdfs dfs -mkdir /user/bd01/examples/unibit.ai/companyprofile
hdfs dfs -mkdir /user/bd01/examples/unibit.ai/companyprofile/csv
hdfs dfs -mkdir /user/bd01/examples/unibit.ai/companyprofile/json
hdfs dfs -mkdir /user/bd01/examples/unibit.ai/historicalstockprice
hdfs dfs -mkdir /user/bd01/examples/unibit.ai/historicalstockprice/csv
hdfs dfs -mkdir /user/bd01/examples/unibit.ai/historicalstockprice/json
#############################################################################################################################
# unzip the files from the local filesytem and put tem into HDFS
# gunzip --stdout data/companyprofile/json/companyprofiles.jq.json.gz |
# hdfs dfs -put "data/companyprofile/json/companyprofiles.jq.json" "/user/${USER}/examples/unibit.ai/companyprofile/json"
# gunzip --stdout data/historicalstockprice/json/historicalstockprice.jq.json.gz |
# hdfs dfs -put "data/historicalstockprice/json/historicalstockprices.1y.jq.json" "/user/${USER}/examples/unibit.ai/historicalstockprice/json"
#############################################################################################################################
# show all the contained files of the unibit.ai directory
hdfs dfs -ls -R /user/bd01/examples/unibit.ai
