#!/bin/sh
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann/bdlc-fetch

#############################################################
# remove directory if it already exists
rm -rf unibitdata/

#############################################################
# make directories
mkdir -p unibitdata/historicalstockprice/csv/
mkdir -p unibitdata/historicalstockprice/json/
mkdir -p unibitdata/companyprofile/csv/
mkdir -p unibitdata/companyprofile/json/


#****** JSON Daten ******#

#############################################################
# JSON: store the stockprices from the API in the created directories and transform them with jq
curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1m&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" | jq -c '. | {ticker: ."Meta Data".ticker, date: ."Stock price"[].date}' >> unibitdata/historicalstockprice/json/historicalstockprices_1y.json
curl "https://api.unibit.ai/historicalstockprice/AMZN?range=1m&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" | jq -c '. | {ticker: ."Meta Data".ticker, date: ."Stock price"[].date}' >> unibitdata/historicalstockprice/json/historicalstockprices_1y.json

#############################################################
# JSON: store the companyprofiles from the API in the created directories and transform them with jq
curl "https://api.unibit.ai/companyprofile/AAPL?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" | jq -c '. | {ticker: ."company profile".ticker, company_name: ."company profile".company_name, exchange: ."company profile".exchange, industry: ."company profile".industry, company_decription: ."company profile".company_decription, company_leadership: ."company profile".company_leadership, sector: ."company profile".sector, asset_type: ."company profile".asset_type}' >> unibitdata/companyprofile/json/companyprofiles.json
curl "https://api.unibit.ai/companyprofile/AMZN?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" | jq -c '. | {ticker: ."company profile".ticker, company_name: ."company profile".company_name, exchange: ."company profile".exchange, industry: ."company profile".industry, company_decription: ."company profile".company_decription, company_leadership: ."company profile".company_leadership, sector: ."company profile".sector, asset_type: ."company profile".asset_type}' >> unibitdata/companyprofile/json/companyprofiles.json


#****** CSV Daten ******#

#############################################################
# CSV: store the stockprices from the API in the created directories
curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1m&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" > unibitdata/historicalstockprice/csv/AAPL_raw.csv
curl "https://api.unibit.ai/historicalstockprice/AMZN?range=1m&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" > unibitdata/historicalstockprice/csv/AMZN_raw.csv

#############################################################
# CSV: store the companyprofiles from the API in the created directories
curl "https://api.unibit.ai/companyprofile/AAPL?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" > unibitdata/companyprofile/csv/AAPL_raw.csv
curl "https://api.unibit.ai/companyprofile/AMZN?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"> unibitdata/companyprofile/csv/AMZN_raw.csv

#############################################################
# CSV: transform companyprofiles
sed -n '1,1p' unibitdata/companyprofile/csv/AAPL_raw.csv > unibitdata/companyprofile/csv/companyprofiles_header.csv
sed -n '2,$p' unibitdata/companyprofile/csv/AAPL_raw.csv > unibitdata/companyprofile/csv/companyprofiles.csv
sed -n '2,$p' unibitdata/companyprofile/csv/AMZN_raw.csv >> unibitdata/companyprofile/csv/companyprofiles.csv
rm unibitdata/companyprofile/csv/AAPL_raw.csv
rm unibitdata/companyprofile/csv/AMZN_raw.csv

#############################################################
# CSV: transform stockprices
sed -n '1,1p;s/^/ticker,/' unibitdata/historicalstockprice/csv/AAPL_raw.csv > unibitdata/historicalstockprice/csv/historicalstockprices_1y_header.csv
sed -n '2,$p;s/^/AAPL,/' unibitdata/historicalstockprice/csv/AAPL_raw.csv > unibitdata/historicalstockprice/csv/historicalstockprices_1y.csv 
sed -n '2,$p;s/^/AMZN,/' unibitdata/historicalstockprice/csv/AMZN_raw.csv >> unibitdata/historicalstockprice/csv/historicalstockprices_1y.csv
rm unibitdata/historicalstockprice/csv/AAPL_raw.csv
rm unibitdata/historicalstockprice/csv/AMZN_raw.csv
#curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1m&interval=3&AccessKey=demo" | jq -c '. | {ticker: ."Meta Data".ticker, date: ."Stock price"[].date, open: ."Stock price"[].open, high: ."Stock price"[].high, low: ."Stock price"[].low, close: ."Stock price"[].close, adj_close: ."Stock price"[].adj_close, volume: ."Stock price"[].volume}' > data/historicalstockprice/json/AAPL_stock.json
