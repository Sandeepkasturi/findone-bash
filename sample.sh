#!/bin/bash

phone_number="123-456-7890"
api_key="YOUR_API_KEY"

url="https://maps.googleapis.com/maps/api/geocode/json?components=phonenumber:${phone_number}&key=${api_key}"

response=$(curl -s "$url")
status=$(echo "$response" | jq -r '.status')

if [ "$status" = "OK" ]; then
    location=$(echo "$response" | jq -r '.results[0].formatted_address')
    echo "The location of ${phone_number} is ${location}"
else
    echo "Unable to find the location of ${phone_number}"
fi
