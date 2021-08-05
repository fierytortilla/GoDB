#note that this script is meant to be carried out on Ubuntu 18.04 using python2.7
#!/bin/sh
yes | sudo apt update
yes | sudo apt install python
yes | sudo apt install perl
yes | sudo apt install gcc
yes | sudo apt install make
yes | sudo apt install git
yes | sudo apt install mongodb
yes | sudo apt install tabix
yes | sudo apt install htslib-test
yes | sudo apt install python-pysam
yes | sudo apt install python-pymongo
#if you want to run the Go packages, run these commands
#sudo apt install golang-go
#go get gopkg.in/mgo.v2
#go get gopkg.in/mgo.v2/bson
#go get github.com/brentp/bix
#go get github.com/brentp/irelate
yes | sudo apt install python-flask
yes | sudo apt install python-flaskext.wtf
git clone https://github.com/fierytortilla/GoDb.git
mkdir data ; mkdir data/broad ; mkdir data/exome ; mkdir data/affy ; mkdir data/illumina ; mkdir data/logs ; mkdir data/genemap
touch data/logs/mongod.log
touch data/start_mongod.sh
#printf "#!/bin/sh\nexport DBPATH=${HOMEGoDB}/data/db\nexport LOGDIR=${HOMEGoDB}/data/logs\nmongod --dbpath $DBPATH > $LOGDIR/mongod.log &" >> data/start_mongod.sh
source GoDB/cfg/common.cfg
#source data/start_mongod.sh
python GoDB/webapp/run.py

