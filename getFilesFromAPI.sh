#!/bin/sh
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann
#######################################################################
# remove directory if it already exists
rm -rf unibitdata/
#######################################################################
# make directories
mkdir -p unibitdata/historicalstockprice/csv/
mkdir -p unibitdata/historicalstockprice/json/
mkdir -p unibitdata/companyprofile/csv/
mkdir -p unibitdata/companyprofile/json/
#######################################################################
# JSON: store the stockprices from the API in the created directories and transform them with jq
curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1m&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" | jq -c '. | {ticker: ."Meta Data".ticker, date: ."Stock price"[].date}' >> unibitdata/historicalstockprice/json/historicalstockprices_1y.json
curl "https://api.unibit.ai/historicalstockprice/AMZN?range=1m&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" | jq -c '. | {ticker: ."Meta Data".ticker, date: ."Stock price"[].date}' >> unibitdata/historicalstockprice/json/historicalstockprices_1y.json
#######################################################################
# JSON: store the companyprofiles from the API in the created directories and transform them with jq
curl "https://api.unibit.ai/companyprofile/AAPL?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" | jq -c '. | {ticker: ."company profile".ticker, company_name: ."company profile".company_name, exchange: ."company profile".exchange, industry: ."company profile".industry, company_decription: ."company profile".company_decription, company_leadership: ."company profile".company_leadership, sector: ."company profile".sector, asset_type: ."company profile".asset_type}' >> unibitdata/companyprofile/json/companyprofiles.json
curl curl "https://api.unibit.ai/companyprofile/AMZN?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" | jq -c '. | {ticker: ."company profile".ticker, company_name: ."company profile".company_name, exchange: ."company profile".exchange, industry: ."company profile".industry, company_decription: ."company profile".company_decription, company_leadership: ."company profile".company_leadership, sector: ."company profile".sector, asset_type: ."company profile".asset_type}' >> unibitdata/companyprofile/json/companyprofiles.json
#######################################################################
# CSV: store the stockprices from the API in the created directories
curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1m&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" > unibitdata/historicalstockprice/csv/AAPL_raw.csv
curl "https://api.unibit.ai/historicalstockprice/AMZN?range=1m&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" > unibitdata/historicalstockprice/csv/AMZN_raw.csv
#######################################################################
# CSV: store the companyprofiles from the API in the created directories
curl "https://api.unibit.ai/companyprofile/AAPL?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" > unibitdata/companyprofile/csv/AAPL_raw.csv
curl "https://api.unibit.ai/companyprofile/AMZN?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0"> unibitdata/companyprofile/csv/AMZN_raw.csv
#######################################################################
# CSV: transform companyprofiles
sed -n '1,1p' unibitdata/companyprofile/csv/AAPL_raw.csv > unibitdata/companyprofile/csv/companyprofiles_header.csv
sed -n '2,$p' unibitdata/companyprofile/csv/AAPL_raw.csv > unibitdata/companyprofile/csv/AAPL_temp.csv
sed -n '2,$p' unibitdata/companyprofile/csv/AMZN_raw.csv > unibitdata/companyprofile/csv/AMZN_temp.csv
cat unibitdata/companyprofile/csv/AAPL_temp.csv unibitdata/companyprofile/csv/AMZN_temp.csv > unibitdata/companyprofile/csv/companyprofiles.csv
#sed -n '2,$p' unibitdata/companyprofile/csv/AAPL_raw.csv | cat >> unibitdata/companyprofile/csv/companyprofiles.csv
#sed -n '2,$p' unibitdata/companyprofile/csv/AMZN_raw.csv | cat >> unibitdata/companyprofile/csv/companyprofiles.csv
#rm unibitdata/companyprofile/csv/AAPL_raw.csv
#rm unibitdata/companyprofile/csv/AMZN_raw.csv
#rm unibitdata/companyprofile/csv/AAPL_temp.csv
#rm unibitdata/companyprofile/csv/AMZN_temp.csv
#######################################################################
# CSV: transform stockprices
sed -n '1,1p' unibitdata/historicalstockprice/csv/AAPL_raw.csv > unibitdata/historicalstockprice/csv/historicalstockprices_1y_header_temp.csv
sed -n '2,$p' unibitdata/historicalstockprice/csv/AAPL_raw.csv > unibitdata/historicalstockprice/csv/AAPL_temp.csv
sed -n '2,$p' unibitdata/historicalstockprice/csv/AMZN_raw.csv > unibitdata/historicalstockprice/csv/AMZN_temp.csv
sed 's/^/ticker,/' unibitdata/historicalstockprice/csv/historicalstockprices_1y_header_temp.csv > unibitdata/historicalstockprice/csv/historicalstockprices_1y_header.csv
sed 's/^/AAPL,/' unibitdata/historicalstockprice/csv/AAPL_temp.csv > unibitdata/historicalstockprice/csv/AAPL_complete.csv
sed 's/^/AMZN,/' unibitdata/historicalstockprice/csv/AMZN_temp.csv > unibitdata/historicalstockprice/csv/AMZN_complete.csv
cat unibitdata/historicalstockprice/csv/AAPL_complete.csv unibitdata/historicalstockprice/csv/AMZN_complete.csv > unibitdata/historicalstockprice/csv/historicalstockprices_1y.csv
#sed 's/^/AAPL,/' unibitdata/historicalstockprice/csv/AAPL_temp.csv | cat >> unibitdata/historicalstockprice/csv/historicalstockprices_1y.csv
#sed 's/^/AMZN,/' unibitdata/historicalstockprice/csv/AMZN_temp.csv | cat >> unibitdata/historicalstockprice/csv/historicalstockprices_1y.csv
#rm unibitdata/historicalstockprice/csv/AAPL_raw.csv
#rm unibitdata/historicalstockprice/csv/AMZN_raw.csv
#rm unibitdata/historicalstockprice/csv/AAPL_temp.csv
#rm unibitdata/historicalstockprice/csv/AMZN_temp.csv
#rm unibitdata/historicalstockprice/csv/AAPL_complete.csv
#rm unibitdata/historicalstockprice/csv/AMZN_complete.csv
#rm unibitdata/historicalstockprice/csv/historicalstockprices_1y_header_temp.csv
#############################Profiles
# sed -n '1,1p' unibit-ai/profiles/csv/IBMraw.csv > unibit-ai/profiles/csv/unibit-ai-companyprofiles.header.csv
# sed -n '2,$p' unibit-ai/profiles/csv/IBMraw.csv > unibit-ai/profiles/csv/IBMtemp.csv
# sed -n '2,$p' unibit-ai/profiles/csv/AMZNraw.csv > unibit-ai/profiles/csv/AMZNtemp.csv
# cat unibit-ai/profiles/csv/IBMtemp.csv unibit-ai/profiles/csv/AMZNtemp.csv > unibit-ai/profiles/csv/unibit-ai-companyprofiles.csv
#rm unibit-ai/profiles/csv/IBMraw.csv
#rm unibit-ai/profiles/csv/IBMtemp.csv
#rm unibit-ai/profiles/csv/AMZNraw.csv
#rm unibit-ai/profiles/csv/AMZNtemp.csv
#############################3Prices
#sed -n '1,1p' unibit-ai/prices/csv/IBMraw.csv > unibit-ai/prices/csv/headertemp.csv
#sed -n '2,$p' unibit-ai/prices/csv/IBMraw.csv > unibit-ai/prices/csv/IBMtemp.csv
#sed -n '2,$p' unibit-ai/prices/csv/AMZNraw.csv >unibit-ai/prices/csv/AMZNtemp.csv
#sed 's/^/ticker,/' unibit-ai/prices/csv/headertemp.csv >unibit-ai/prices/csv/unibit-ai-historicalstockprices.1y.ticker.header.csv
#sed 's/^/IBM,/' unibit-ai/prices/csv/IBMtemp.csv >unibit-ai/prices/csv/IBMcomplete.csv
#sed 's/^/AMZN,/' unibit-ai/prices/csv/AMZNtemp.csv >unibit-ai/prices/csv/AMZNcomplete.csv
#cat unibit-ai/prices/csv/IBMcomplete.csv unibit-ai/prices/csv/AMZNcomplete.csv >unibit-ai/prices/csv/unibit-ai-historicalstockprices.1y.ticker.csv
#rm unibit-ai/prices/csv/IBMraw.csv
#rm unibit-ai/prices/csv/IBMtemp.csv
#rm unibit-ai/prices/csv/IBMcomplete.csv
#rm unibit-ai/prices/csv/AMZNraw.csv
#rm unibit-ai/prices/csv/AMZNtemp.csv
#rm unibit-ai/prices/csv/AMZNcomplete.csv
#rm unibit-ai/prices/csv/headertemp.csv
#Problem, deadlock #
# curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1m&interval=3&AccessKey=demo" | jq -c '. | {ticker: ."Meta Data".ticker, date: ."Stock price"[].date, open: ."Stock price"[].open, high: ."Stock price"[].high, low: ."Stock price"[].low, close: ."Stock price"[].close, adj_close: ."Stock price"[].adj_close, volume: ."Stock price"[].volume}' > data/historicalstockprice/json/AAPL_stock.json