cd $(dirname $0)

rm -rf data/historicalstockprice/csv/
rm -rf data/historicalstockprice/json/
rm -rf data/companyprofile/csv/
rm -rf data/companyprofile/json/


mkdir -p data/historicalstockprice/csv/
mkdir -p data/historicalstockprice/json/
mkdir -p data/companyprofile/csv/
mkdir -p data/companyprofile/json/


cd data/historicalstockprice/json/

wget 'https://api.unibit.ai/historicalstockprice/AAPL?range=12m&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0'
wget 'https://api.unibit.ai/historicalstockprice/AMZN?range=12m&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0'


cd data/historicalstockprice/csv/

wget 'https://api.unibit.ai/historicalstockprice/AAPL?range=12m&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0'
wget 'https://api.unibit.ai/historicalstockprice/AMZN?range=12m&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0'



cd data/companyprofile/json/

wget 'https://api.unibit.ai/companyprofile/AAPL?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0'
wget 'https://api.unibit.ai/companyprofile/AMZN?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0'



cd data/companyprofile/csv/

wget 'https://api.unibit.ai/companyprofile/AAPL?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0'
wget 'https://api.unibit.ai/companyprofile/AMZN?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0'
