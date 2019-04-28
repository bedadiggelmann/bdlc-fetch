#!/usr/bin/env bash
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann

cd $(dirname $0)

hdfs dfs -mkdir /user/${USER}/examples/unibit.ai
hdfs dfs -mkdir /user/${USER}/examples/unibit.ai/companyprofile
hdfs dfs -mkdir /user/${USER}/examples/unibit.ai/companyprofile/csv
hdfs dfs -mkdir /user/${USER}/examples/unibit.ai/companyprofile/json
hdfs dfs -mkdir /user/${USER}/examples/unibit.ai/historicalstockprice
hdfs dfs -mkdir /user/${USER}/examples/unibit.ai/historicalstockprice/csv
hdfs dfs -mkdir /user/${USER}/examples/unibit.ai/historicalstockprice/json
