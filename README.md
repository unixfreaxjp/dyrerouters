# dyrerouters

## Milking scripts collection
```
This branch consists of various milking scripts for various purpose using the 
db*.txt files placed in the master branch.
Please post your request in the "issue" tab in the project github page to submit
```
Milking logic sample:
```
# @unixfreaxjp #MalwareMustDie shared info. Ver 3.0 under WTFL license.
payload[0]='[payload1]';
payload[1]='[payload2]';
payload[b]='[payloadn]';

while read router
do
echo;
        for i in `seq 0 n`;
        do
          echo -n $router" " && echo -n ${payload[i]}" ";
          wget https://$router/${payload[i]};
          sleep 0;
        done
done
exit 0;
```
