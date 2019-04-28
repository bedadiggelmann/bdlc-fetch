#!/usr/bin/env bash
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann

#################################################################################################################################################
# remove directories if they already exist
rm -rf data/historicalstockprice/
rm -rf data/companyprofile/
#################################################################################################################################################
# create directories
mkdir -p data/historicalstockprice/csv/
mkdir -p data/historicalstockprice/json/
mkdir -p data/companyprofile/csv/
mkdir -p data/companyprofile/json/
#################################################################################################################################################
# store the data from the API in the created directories
curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1m&interval=3&AccessKey=demo" > data/historicalstockprice/json/AAPL_stock.json
# wget "https://api.unibit.ai/historicalstockprice/AAPL?range=1y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"
# wget "https://api.unibit.ai/historicalstockprice/AMZN?range=1y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"
curl "https://api.unibit.ai/historicalstockprice/AAPL?range=3y&interval=100&datatype=csv&AccessKey=demo" > data/historicalstockprice/csv/AAPL_stock.csv
# wget "https://api.unibit.ai/historicalstockprice/AAPL?range=1y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"
# wget "https://api.unibit.ai/historicalstockprice/AMZN?range=1y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"
curl "https://api.unibit.ai/companyprofile/AAPL?AccessKey=demo" > data/companyprofile/json/AAPL_profile.json
# wget "https://api.unibit.ai/companyprofile/AAPL?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"
# wget "https://api.unibit.ai/companyprofile/AMZN?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"
curl "https://api.unibit.ai/companyprofile/AAPL?datatype=csv&AccessKey=demo" > data/companyprofile/csv/AAPL_profile.csv
# wget "https://api.unibit.ai/companyprofile/AAPL?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"
# wget "https://api.unibit.ai/companyprofile/AMZN?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"
