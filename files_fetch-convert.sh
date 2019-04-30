#!/bin/sh
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann/bdlc-fetch

## ###########################################################
## remove directory if it already exists
rm -rf unibitdata/

## ###########################################################
## make directories
mkdir -p unibitdata/historicalstockprice/csv/
mkdir -p unibitdata/historicalstockprice/json/
mkdir -p unibitdata/companyprofile/csv/
mkdir -p unibitdata/companyprofile/json/


## ###########################################################
## JSON: get stockprices from API - transform with jq
curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" | jq -c '
{
	ticker: .["Meta Data"].ticker,
	stock: .["Stock price"][]
}|{
	ticker: .ticker,
	date: .stock.date,
	open: .stock.open,
	high: .stock.high,
	low: .stock.low,
	close: .stock.close,
	adj_close: .stock.adj_close,
	volume: .stock.volume
}
' >> unibitdata/historicalstockprice/json/historicalstockprices_1y.json

curl "https://api.unibit.ai/historicalstockprice/AMZN?range=1y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" | jq -c '
{
	ticker: .["Meta Data"].ticker,
	stock: .["Stock price"][]
}|{
	ticker: .ticker,
	date: .stock.date,
	open: .stock.open,
	high: .stock.high,
	low: .stock.low,
	close: .stock.close,
	adj_close: .stock.adj_close,
	volume: .stock.volume
}
' >> unibitdata/historicalstockprice/json/historicalstockprices_1y.json


## ###########################################################
## JSON: get companyprofiles from API - transform with jq
curl "https://api.unibit.ai/companyprofile/AAPL?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" | jq -c '. | 
{
	ticker:				."company profile".ticker,
	company_name:		."company profile".company_name,
	exchange:			."company profile".exchange,
	industry:			."company profile".industry,
	company_decription:	."company profile".company_decription,
	company_leadership:	."company profile".company_leadership,
	sector:				."company profile".sector,
	asset_type:			."company profile".asset_type
}
' >> unibitdata/companyprofile/json/companyprofiles.json

curl "https://api.unibit.ai/companyprofile/AMZN?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" | jq -c '. | 
{
	ticker:				."company profile".ticker,
	company_name:		."company profile".company_name,
	exchange:			."company profile".exchange,
	industry:			."company profile".industry,
	company_decription:	."company profile".company_decription,
	company_leadership:	."company profile".company_leadership,
	sector:				."company profile".sector,
	asset_type:			."company profile".asset_type
}
' >> unibitdata/companyprofile/json/companyprofiles.json


## ###########################################################
## CSV: get stockprices from API - transform with sed
curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" |
	sed -n '1,1p' |
	sed 's/^/ticker,/
'	> unibitdata/historicalstockprice/csv/historicalstockprices_1y_header.csv
	
curl "https://api.unibit.ai/historicalstockprice/AAPL?range=1y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" |
	sed -n '2,$p' |
	sed 's/^/AAPL,/
'	> unibitdata/historicalstockprice/csv/historicalstockprices_1y.csv 
	
curl "https://api.unibit.ai/historicalstockprice/AMZN?range=1y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" |
	sed -n '2,$p' |
	sed 's/^/AMZN,/
'	>> unibitdata/historicalstockprice/csv/historicalstockprices_1y.csv


## ###########################################################
## CSV: get companyprofiles from API - transform with sed
curl "https://api.unibit.ai/companyprofile/AAPL?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" |
	sed -n '1,1p
' 	> unibitdata/companyprofile/csv/companyprofiles_header.csv
	
curl "https://api.unibit.ai/companyprofile/AAPL?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" |
	sed -n '2,$p
'	> unibitdata/companyprofile/csv/companyprofiles.csv
	
curl "https://api.unibit.ai/companyprofile/AMZN?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0" |
	sed -n '2,$p
'	>> unibitdata/companyprofile/csv/companyprofiles.csv