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


#****** JSON data ******#

#############################################################
# JSON: get the stockprices from API - transform stocckprices with jq
curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1m&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" | jq -c '{ticker: .["Meta Data"].ticker, stock: .["Stock price"][]} | {ticker: .ticker, date: .stock.date, open: .stock.open, high: .stock.high, low: .stock.low, close: .stock.close, adj_close: .stock.adj_close, volume: .stock.volume}' >> unibitdata/historicalstockprice/json/historicalstockprices_1y.json
curl "https://api.unibit.ai/historicalstockprice/AMZN?range=1m&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" | jq -c '{ticker: .["Meta Data"].ticker, stock: .["Stock price"][]} | {ticker: .ticker, date: .stock.date, open: .stock.open, high: .stock.high, low: .stock.low, close: .stock.close, adj_close: .stock.adj_close, volume: .stock.volume}' >> unibitdata/historicalstockprice/json/historicalstockprices_1y.json

#############################################################
# JSON: store the companyprofiles from the API in the created directories and transform them with jq
curl "https://api.unibit.ai/companyprofile/AAPL?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" | jq -c '. | {ticker: ."company profile".ticker, company_name: ."company profile".company_name, exchange: ."company profile".exchange, industry: ."company profile".industry, company_decription: ."company profile".company_decription, company_leadership: ."company profile".company_leadership, sector: ."company profile".sector, asset_type: ."company profile".asset_type}' >> unibitdata/companyprofile/json/companyprofiles.json
curl "https://api.unibit.ai/companyprofile/AMZN?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" | jq -c '. | {ticker: ."company profile".ticker, company_name: ."company profile".company_name, exchange: ."company profile".exchange, industry: ."company profile".industry, company_decription: ."company profile".company_decription, company_leadership: ."company profile".company_leadership, sector: ."company profile".sector, asset_type: ."company profile".asset_type}' >> unibitdata/companyprofile/json/companyprofiles.json


#****** CSV data ******#

#############################################################
# CSV: get the stockprices from API
curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1m&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" > unibitdata/historicalstockprice/csv/AAPL_stock.csv
curl "https://api.unibit.ai/historicalstockprice/AMZN?range=1m&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" > unibitdata/historicalstockprice/csv/AMZN_stock.csv

#############################################################
# CSV: transform stockprices with sed
sed -n '1,1p' unibitdata/historicalstockprice/csv/AAPL_stock.csv | sed 's/^/ticker,/' > unibitdata/historicalstockprice/csv/historicalstockprices_1y_header.csv
sed -n '2,$p' unibitdata/historicalstockprice/csv/AAPL_stock.csv | sed 's/^/AAPL,/' > unibitdata/historicalstockprice/csv/historicalstockprices_1y.csv 
sed -n '2,$p' unibitdata/historicalstockprice/csv/AMZN_stock.csv | sed 's/^/AMZN,/' >> unibitdata/historicalstockprice/csv/historicalstockprices_1y.csv
rm unibitdata/historicalstockprice/csv/AAPL_stock.csv
rm unibitdata/historicalstockprice/csv/AMZN_stock.csv

#############################################################
# CSV: get the companyprofiles from API
curl "https://api.unibit.ai/companyprofile/AAPL?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" > unibitdata/companyprofile/csv/AAPL_stock.csv
curl "https://api.unibit.ai/companyprofile/AMZN?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"> unibitdata/companyprofile/csv/AMZN_stock.csv

#############################################################
# CSV: transform companyprofiles with sed
sed -n '1,1p' unibitdata/companyprofile/csv/AAPL_stock.csv > unibitdata/companyprofile/csv/companyprofiles_header.csv
sed -n '2,$p' unibitdata/companyprofile/csv/AAPL_stock.csv > unibitdata/companyprofile/csv/companyprofiles.csv
sed -n '2,$p' unibitdata/companyprofile/csv/AMZN_stock.csv >> unibitdata/companyprofile/csv/companyprofiles.csv
rm unibitdata/companyprofile/csv/AAPL_stock.csv
rm unibitdata/companyprofile/csv/AMZN_stock.csv
