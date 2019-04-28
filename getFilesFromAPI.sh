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
# curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1m&interval=3&AccessKey=demo" | jq -c '."Stock price"[]' > data/historicalstockprice/json/AAPL_stock_new.json
curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1m&interval=3&AccessKey=demo" | jq -c '. | {ticker: ."Meta Data".ticker, date: ."Stock price"[].date, open: ."Stock price"[].open, high: ."Stock price"[].high, low: ."Stock price"[].low, close: ."Stock price"[].close, adj_close: ."Stock price"[].adj_close, volume: ."Stock price"[].volume}' > data/historicalstockprice/json/AAPL_stock.json
curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1m&interval=3&AccessKey=demo" > data/historicalstockprice/json/AMZN_stock.json
# curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" > data/historicalstockprice/json/AAPL_stock.json
# curl "https://api.unibit.ai/historicalstockprice/AMZN?range=1y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" > data/historicalstockprice/json/AMZN_stock.json
########################
# curl "https://api.unibit.ai/historicalstockprice/AAPL?range=3y&interval=100&datatype=csv&AccessKey=demo" > data/historicalstockprice/csv/AAPL_stock.csv
# curl "https://api.unibit.ai/historicalstockprice/AAPL?range=3y&interval=100&datatype=csv&AccessKey=demo" > data/historicalstockprice/csv/AMZN_stock.csv
# curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" > data/historicalstockprice/csv/AAPL_stock.csv
# curl "https://api.unibit.ai/historicalstockprice/AMZN?range=1y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" > data/historicalstockprice/csv/AMZN_stock.csv
########################
curl "https://api.unibit.ai/companyprofile/AAPL?AccessKey=demo" | jq -c '. | {ticker: ."company profile".ticker, company_name: ."company profile".company_name, exchange: ."company profile".exchange, industry: ."company profile".industry, company_decription: ."company profile".company_decription, company_leadership: ."company profile".company_leadership, sector: ."company profile".sector, asset_type: ."company profile".asset_type}' > data/companyprofile/json/AAPL_profile.json
 curl "https://api.unibit.ai/companyprofile/AAPL?AccessKey=demo" > data/companyprofile/json/AMZN_profile.json
# curl "https://api.unibit.ai/companyprofile/AAPL?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" > data/companyprofile/json/AAPL_profile.json
# curl "https://api.unibit.ai/companyprofile/AMZN?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" > data/companyprofile/json/AMZN_profile.json
########################
# curl "https://api.unibit.ai/companyprofile/AAPL?datatype=csv&AccessKey=demo" > data/companyprofile/csv/AAPL_profile.csv
# curl "https://api.unibit.ai/companyprofile/AAPL?datatype=csv&AccessKey=demo" > data/companyprofile/csv/AMZN_profile.csv
# curl "https://api.unibit.ai/companyprofile/AAPL?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" > data/companyprofile/csv/AAPL_profile.csv
# curl "https://api.unibit.ai/companyprofile/AMZN?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" > data/companyprofile/csv/AMZN_profile.csv
