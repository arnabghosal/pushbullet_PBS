#!/bin/bash
#Author  : Arnab Ghosal
#GIT URL : https://github.com/arnabghosal/pushbullet_PBS
#Created : 25-Nov-2015
#Updated : 26-Nov-2015
#Version : 0.2

PSH_TKN="" #Insert Pushover Token
PBS_DTS=$(date +%Y/%m/%d)
PBS_FILE="PBS-$(date -d "$PBS_DTS" +%Y-%m-%d)"
TMP_URL=/dev/shm/url.list
PSH_URL="https://api.pushbullet.com/v2"
PBS_LINK="http://www.gocomics.com/pearlsbeforeswine"
PBS_TXT="<img alt=\"Pearls Before Swine\""

PBS_IMG=$(wget -qO- "${PBS_LINK}/${PBS_DTS}" | sed 's/></>\n</g' | grep "${PBS_TXT}" | grep -Po '(?<=src=")[^"]*')
wget -q -O "${PBS_FILE}.gif" "${PBS_IMG}"

PSH_JSON='{"file_name":'\"${PBS_FILE}\"',"file_type":"image/gif"}'
curl -s -X POST "$PSH_URL/upload-request" -H "Access-Token: $PSH_TKN" -H "Content-Type: application/json" --data-binary "${PSH_JSON}" > $TMP_URL
sed -i -e 's/":"/=/g' -e 's/[{}"]/''/g' -e 's/,/\n/g' $TMP_URL
PSH_FILE=$(grep file_url $TMP_URL | awk -F '=' '{print $NF}')
PSH_UPL=$(grep upload_url $TMP_URL | awk -F '=' '{print $NF}')
curl -s -i -X POST "${PSH_UPL}" -F file=@"${PBS_FILE}.gif" > /dev/null

PSH_JSON='{"type":"file","title":"Pearls Before Swine - '$(date -d "${1}" +%d/%b)\"',"file_name":'\"${PBS_FILE}.gif\"',"file_type":"image/gif","file_url":'\"${PSH_FILE}\"'}'
curl -s -X POST "$PSH_URL/pushes" -H "Access-Token: $PSH_TKN" -H "Content-type: application/json" --data-binary "${PSH_JSON}" > /dev/null

rm -f $TMP_URL

exit 0
