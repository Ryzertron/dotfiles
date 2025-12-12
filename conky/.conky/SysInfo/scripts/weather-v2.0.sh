#!/bin/bash
# Variables
# get your city id at https://openweathermap.org/find and replace
city_id=7289568
#--------------------------------------------------------
#Go to openweathermap.org to get your api key
#api_key=<YOUR API KEY>
# -------------------------------------------------------
# Load the secret values if available
if [ -f "./secrets.sh" ]; then
    . ./secrets.sh   # Same as "source"

# choose between metric for Celcius or imperial for fahrenheit
unit=metric

# i'm not sure it will support all languange, 
lang=en

# Main command
url="api.openweathermap.org/data/2.5/weather?id=${city_id}&appid=${api_key}&cnt=5&units=${unit}&lang=${lang}"
curl ${url} -s -o ~/.cache/weather.json

exit
