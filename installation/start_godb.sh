#!/bin/bash

set -eu

cd $HOME

sudo apt -y update

sudo apt -y install python perl gcc make git \
     mongodb tabix libbz2-dev libncurses5-dev \
     libncursesw5-dev liblzma-dev cython python-pysam \
     python-pymongo htslib-test python-flask \
     python-flaskext.wtf

#if you want to run the Go packages, run these commands
#sudo apt install golang-go
#go get gopkg.in/mgo.v2
#go get gopkg.in/mgo.v2/bson
#go get github.com/brentp/bix
#go get github.com/brentp/irelate

if [ -d GoDB ] ; then
    cd GoDB
    git pull
    cd ..
else
    git clone https://github.com/fierytortilla/GoDB.git GoDB
fi

mkdir -p data/{broad,exome,affy,illumina,logs,genemap}

touch data/logs/mongod.log

cat <<EOF > data/start_mongod.sh
#!/bin/sh
export DBPATH=${PWD}/data/db
export LOGDIR=${PWD}/data/logs
mongod --dbpath \$DBPATH > \$LOGDIR/mongod.log &
EOF

chmod +x data/start_mongod.sh
./data/start_mongod.sh

. GoDB/cfg/common.cfg

python GoDB/webapp/run.py


