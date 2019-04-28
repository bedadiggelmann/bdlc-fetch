#!/usr/bin/env bash
# 2019-04, Beda Diggelmann, https://github.com/bedadiggelmann

cd $(dirname $0)

#################################################################################################################################################
# remove directories if they already exist
rm -rf data/historicalstockprice/csv/
rm -rf data/historicalstockprice/json/
rm -rf data/companyprofile/csv/
rm -rf data/companyprofile/json/

#################################################################################################################################################
# create directories
mkdir -p data/historicalstockprice/csv/
mkdir -p data/historicalstockprice/json/
mkdir -p data/companyprofile/csv/
mkdir -p data/companyprofile/json/


#################################################################################################################################################
# store the data from the API in the created directories

cd data/historicalstockprice/json/
wget 'https://api.unibit.ai/historicalstockprice/AAPL?range=1m&interval=3&AccessKey=demo'

# wget 'https://api.unibit.ai/historicalstockprice/AAPL?range=12m&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0'
# wget 'https://api.unibit.ai/historicalstockprice/AMZN?range=12m&interval=1&datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0'


cd data/historicalstockprice/csv/

wget 'https://api.unibit.ai/historicalstockprice/AAPL?range=3y&interval=100&datatype=csv&AccessKey=demo'

# wget 'https://api.unibit.ai/historicalstockprice/AAPL?range=12m&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0'
# wget 'https://api.unibit.ai/historicalstockprice/AMZN?range=12m&interval=1&datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0'



cd data/companyprofile/json/

wget 'https://api.unibit.ai/companyprofile/AAPL?AccessKey=demo'

# wget 'https://api.unibit.ai/companyprofile/AAPL?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0'
# wget 'https://api.unibit.ai/companyprofile/AMZN?datatype=json&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0'



cd data/companyprofile/csv/

wget 'https://api.unibit.ai/companyprofile/AAPL?datatype=csv&AccessKey=demo'

# wget 'https://api.unibit.ai/companyprofile/AAPL?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0'
# wget 'https://api.unibit.ai/companyprofile/AMZN?datatype=csv&AccessKey=FeVyD9yxVwaP6AGZXNwGm2zMCyuR5ki0'

cd ..
ll
