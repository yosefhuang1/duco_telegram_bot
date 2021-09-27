#!/bin/bash

TOKEN="YOUR_TOKEN"
ID="ID_CHAT"
WALLET="USERNAME_WALLET"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"
MSG="ᕲ DuinoCoin"
# PWB="Powered by azagramac"
JSON=$(curl -s -X GET https://server.duinocoin.com/users/$WALLET -H "Accept: application/json" | jq .)
#EURO=$(curl -s -X GET http://www.floatrates.com/daily/usd.json -H "Accept: application/json" | jq .eur | jq '.rate')
APIJSON=$(curl -s -X GET https://server.duinocoin.com/api.json -H "Accept: application/json" | jq .)
USR=$(echo $JSON | jq '.result.balance.username')
VERIFYCHECK=$(echo $JSON | jq '.result.balance.verified')
VERSION="V1.0"
BALANCE=$(echo $JSON | jq '.result.balance.balance')
WORKERS=$(echo $JSON | jq '.result.miners' | jq '.[].identifier')
NUMBER_WORKERS=$(echo $JSON | jq -r '.result.miners' | jq -r '.[].identifier' | wc -l)
FORMAT1=$(echo "scale=2; $BALANCE/1" | bc -l)
#FORMAT2=$(echo "scale=2; $EURO/1" | bc -l)
DUCOPRICE=$(echo $APIJSON | jq '."Duco price"')
XRP=$(echo $APIJSON | jq '."Duco price XRP"')
TRX=$(echo $APIJSON | jq '."Duco price TRX"')

if [ $? -ne 0 ]
then
        exit 0
else
        /usr/bin/curl -s -X POST $URL \
                -d chat_id=$ID \
                -d parse_mode=HTML \
                -d text="$(printf "$MSG\n\t \U1F4B3 ID: <code>$USR</code>\n\t \U2705 Verify: <code>$VERIFYCHECK</code>\n\t \U2699 Version: <code>$VERSION</code>\n\t \U1FA99 Balance: <code>$FORMAT1 ᕲ</code>\n\t \U1F4B0 Duco Price: <code>$DUCOPRICE</code>\n\t \U1F4B0 XRP: <code>$XRP</code>\n\t \U1F4B0 TRX: <code>$TRX</code>\n\t \U26CF Nº Workers $NUMBER_WORKERS:\n<code>$WORKERS</code>")" \
                > /dev/null 2>&1
        exit 0
fi