#!/bin/bash
payload=(`cat db3.txt`)

for ip in `cat db2.txt`
do
  valid=`curl -o /dev/null --silent --head --write-out '%{http_code}' $ip -L -k`
  if [ "$valid" != "000" ]
  then
    for pay in "${payload[@]}"
    do
      curl -L -o /dev/null --silent --head --write-out '%{http_code} %{url_effective}  \n' $ip/$pay --connect-timeout 10 -k
    done
  fi
done
#
