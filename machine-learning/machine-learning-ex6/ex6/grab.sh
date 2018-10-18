#!/bin/bash

#
curl https://api.gdax.com/products/LTC-USD/book?level=2 > price.json
curl https://api.gdax.com/products/LTC-USD/ticker > ticker.json

#
cat ticker.json | jq -r '[.price, .bid, .ask, .volume] | @csv' | tr -d '"' > tick.csv

cat price.json |jq --raw-output '.asks[] | @csv' | tr -d '"' > ask.csv

cat price.json |jq --raw-output '.bids[] | @csv' | tr -d '"' > bid.csv
