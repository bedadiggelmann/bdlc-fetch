cd $HOME

rm -rf data/historicalstockprice/csv/
rm -rf data/historicalstockprice/json/
rm -rf data/companyprofile/csv/
rm -rf data/companyprofile/json/


mkdir -p data/historicalstockprice/csv/
mkdir -p data/historicalstockprice/json/
mkdir -p data/companyprofile/csv/
mkdir -p data/companyprofile/json/


cd data/historicalstockprice/json/

wget https://api.unibit.ai/historicalstockprice/AAPL?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/AMZN?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/CLDR?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/CSCO?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/DBX?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/FB?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/GOOGL?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/HPQ?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/IBM?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/JNPR?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/MSFT?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/NFLX?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/NTAP?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/ORCL?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/RHT?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/SNAP?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/SPOT?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/TSLA?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/TWTR?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/VMW?range=20y&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0


cd data/historicalstockprice/csv/

wget https://api.unibit.ai/historicalstockprice/AAPL?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/AMZN?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/CLDR?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/CSCO?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/DBX?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/FB?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/GOOGL?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/HPQ?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/IBM?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/JNPR?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/MSFT?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/NFLX?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/NTAP?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/ORCL?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/RHT?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/SNAP?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/SPOT?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/TSLA?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/TWTR?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/historicalstockprice/VMW?range=20y&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0


cd data/companyprofile/json/

wget https://api.unibit.ai/companyprofile/AAPL?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/AMZN?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/CLDR?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/CSCO?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/DBX?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/FB?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/GOOGL?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/HPQ?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/IBM?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/JNPR?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/MSFT?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/NFLX?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/NTAP?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/ORCL?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/RHT?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/SNAP?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/SPOT?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/TSLA?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/TWTR?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/VMW?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0


cd data/companyprofile/csv/

wget https://api.unibit.ai/companyprofile/AAPL?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/AMZN?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/CLDR?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/CSCO?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/DBX?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/FB?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/GOOGL?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/HPQ?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/IBM?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/JNPR?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/MSFT?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/NFLX?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/NTAP?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/ORCL?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/RHT?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/SNAP?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/SPOT?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/TSLA?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/TWTR?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
wget https://api.unibit.ai/companyprofile/VMW?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0
