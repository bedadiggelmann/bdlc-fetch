#!/bin/sh
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann
#################################################################################################################################################
# remove directory if they already exist
rm -rf unibitdata/
#################################################################################################################################################
# create directories
mkdir -p unibitdata/historicalstockprice/csv/
mkdir -p unibitdata/historicalstockprice/json/
mkdir -p unibitdata/companyprofile/csv/
mkdir -p unibitdata/companyprofile/json/
#################################################################################################################################################
# store the data from the API in the created directories
curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1m&interval=3&AccessKey=demo" | jq -c '. | {ticker: ."Meta Data".ticker, date: ."Stock price"[].date}' >> unibitdata/historicalstockprice/json/historicalstockprices_1y.json
curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1m&interval=3&AccessKey=demo" | jq -c '. | {ticker: ."Meta Data".ticker, date: ."Stock price"[].date}' >> unibitdata/historicalstockprice/json/historicalstockprices_1y.json
# curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"
# curl "https://api.unibit.ai/historicalstockprice/AMZN?range=1y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"
########################
# curl "https://api.unibit.ai/historicalstockprice/AAPL?range=3y&interval=100&datatype=csv&AccessKey=demo" > data/historicalstockprice/csv/AAPL_stock.csv
# curl "https://api.unibit.ai/historicalstockprice/AAPL?range=3y&interval=100&datatype=csv&AccessKey=demo" > data/historicalstockprice/csv/AMZN_stock.csv
# curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"
# curl "https://api.unibit.ai/historicalstockprice/AMZN?range=1y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"
########################
curl "https://api.unibit.ai/companyprofile/AAPL?AccessKey=demo" | jq -c '. | {ticker: ."company profile".ticker, company_name: ."company profile".company_name, exchange: ."company profile".exchange, industry: ."company profile".industry, company_decription: ."company profile".company_decription, company_leadership: ."company profile".company_leadership, sector: ."company profile".sector, asset_type: ."company profile".asset_type}' >> unibitdata/companyprofile/json/companyprofiles.json
curl "https://api.unibit.ai/companyprofile/AAPL?AccessKey=demo" | jq -c '. | {ticker: ."company profile".ticker, company_name: ."company profile".company_name, exchange: ."company profile".exchange, industry: ."company profile".industry, company_decription: ."company profile".company_decription, company_leadership: ."company profile".company_leadership, sector: ."company profile".sector, asset_type: ."company profile".asset_type}' >> unibitdata/companyprofile/json/companyprofiles.json
# curl "https://api.unibit.ai/companyprofile/AAPL?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"
# curl "https://api.unibit.ai/companyprofile/AMZN?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"
########################
# curl "https://api.unibit.ai/companyprofile/AAPL?datatype=csv&AccessKey=demo" > data/companyprofile/csv/AAPL_profile.csv
# curl "https://api.unibit.ai/companyprofile/AAPL?datatype=csv&AccessKey=demo" > data/companyprofile/csv/AMZN_profile.csv
# curl "https://api.unibit.ai/companyprofile/AAPL?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"
# curl "https://api.unibit.ai/companyprofile/AMZN?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"
#################################################################################################################################################
# zip files
# gunzip  data/historicalstockprice/json/historicalstockprices.1y.jq.json
# gunzip  data/companyprofile/json/companyprofiles.jq.json
#
#
#
#
#
#
#
#
#
#
#Problem, deadlock #
# curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1m&interval=3&AccessKey=demo" | jq -c '. | {ticker: ."Meta Data".ticker, date: ."Stock price"[].date, open: ."Stock price"[].open, high: ."Stock price"[].high, low: ."Stock price"[].low, close: ."Stock price"[].close, adj_close: ."Stock price"[].adj_close, volume: ."Stock price"[].volume}' > data/historicalstockprice/json/AAPL_stock.json
