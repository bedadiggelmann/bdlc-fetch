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


for gz in companyprofile/data/csv/unibit-ai-companyprofiles*.gz; do
		fname=$(basename ${gz} .gz)
		gunzip --stdout ${gz} | hdfs dfs -put -  /user/${USER}/examples/unibit.ai/companyprofile/csv/${fname}
done

for gz in companyprofile/data/json/*jq.json.gz; do
		fname=$(basename ${gz} .gz)
		gunzip --stdout ${gz} | hdfs dfs -put -  /user/${USER}/examples/unibit.ai/companyprofile/json/${fname}
done

for gz in historicalstockprice/data/csv/unibit-ai-historicalstockprices*.gz; do
		fname=$(basename ${gz} .gz)
		gunzip --stdout ${gz} | hdfs dfs -put -  /user/${USER}/examples/unibit.ai/historicalstockprice/csv/${fname}
done

for gz in historicalstockprice/data/csv/unibit-ai-historicalstockprice-*.gz; do
		fname=$(basename ${gz} .gz)
		gunzip --stdout ${gz} | tail -n +2 | hdfs dfs -put -  /user/${USER}/examples/unibit.ai/historicalstockprice/csv/${fname}
done

for gz in historicalstockprice/data/json/*jq.json.gz; do
		fname=$(basename ${gz} .gz)
		gunzip --stdout ${gz} | hdfs dfs -put -  /user/${USER}/examples/unibit.ai/historicalstockprice/json/${fname}
done


#############################################################################################################################
# show all the contained files of the unibit.ai directory
hdfs dfs -ls -R /user/${USER}/examples/unibit.ai
