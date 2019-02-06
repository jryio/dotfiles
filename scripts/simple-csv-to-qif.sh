#!/bin/bash

FILE=$1
NEW_FILE=/tmp/bank.tmp
OUTPUT="Active:Bank-Name:CreditCard.qif"
SKIP=1

iconv -t UTF-8 -f ISO-8859-15 $FILE > $NEW_FILE

./csv-to-qif/dist/build/csv-to-qif/csv-to-qif --input=$NEW_FILE \
           --output=$OUTPUT \
           --date=0 \
           --text=6 \
           --longtext=7 \
           --balance=3 \
           --skip=$SKIP \
           --separator=',' \

head -n $SKIP $FILE
