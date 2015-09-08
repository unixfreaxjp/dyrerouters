# dyrerouters

## Statistic
Statistic of hacked router GeoIP:
```
Country		Count
United States	41
Poland		19
India		12
Czech Republic	10
Serbia		 6
Canada		 4
Ukraine		 3
Nigeria		 3
Hungary		 2
Ecuador		 2
Sweden		 1
Slovakia	 1
```

## Usage

Use the script logic like below to monitor infection per new payload:
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
[RAW-LOG.TXT] generated is useful for many checks, contains data like:
```
109.86.226.85 AUv6.77.tar WARNING: cannot verify 109.86.226.85's certificate, is
sued by 'CN=iS8Ifal9yEweDdUiQzm,O=MA8fw60oDpLUNZ8GEaQH2bQGGWw1Ix87MaZYZANfQTMjcD
dLhEQRi4DabtYqzDnJ,L=xpIxFIrCJDFPqfAs5NQHs097nSk5fZlgtDsFD8P2lAvJX3TRZOFEW4cDuXk
DmDT24003zcff5C9b,ST=PX,C=NY':
 Self-signed certificate encountered.
   WARNING: certificate common name 'iS8Ifal9yEweDdUiQzm' doesn't match request
ed host name '109.86.226.85'.
 
104.174.123.66 AUv6.77.tar failed: Operation timed out.
 
109.236.121.91 AUv6.77.tar failed: Connection refused.
 
109.86.226.85 AUv6.77.tar WARNING: cannot verify 109.86.226.85's certificate, issued by 'CN=iS8Ifal9yEweDdUiQzm,O=MA8fw60oDpLUNZ8GEaQH2bQGGWw1Ix87MaZYZANfQTMjcDdLhEQRi4DabtYqzDnJ,L=xpIxFIrCJDFPqfAs5NQHs097nSk5fZlgtDsFD8P2lAvJX3TRZOFEW4cDuXkDmDT24003zcff5C9b,ST=PX,C=NY':
 Self-signed certificate encountered.
   WARNING: certificate common name 'iS8Ifal9yEweDdUiQzm' doesn't match requested host name '109.86.226.85'.
https://109.86.226.85/AUv6.77.tar:
2015-08-19 15:06:23 ERROR 403: Forbidden.
 
162.153.189.143 AUv6.77.tar WARNING: cannot verify 162.153.189.143's certificate, issued by 'emailAddress=support@ubnt.com,CN=UBNT,OU=Technical Support,O=Ubiquiti Networks Inc.,L=San Jose,ST=CA,C=US':
 Self-signed certificate encountered.
   WARNING: certificate common name 'UBNT' doesn't match requested host name '162.153.189.143'.
2015-08-19 15:06:26 URL:https://162.153.189.143/login.cgi?uri=/AUv6.77.tar [3275] -> "/dev/null" [1]
 
194.106.166.22 AUv6.77.tar WARNING: cannot verify 194.106.166.22's certificate, issued by 'CN=cAvWp6IY477or7Zq58YWDDv9CMoGxeBN3l2zFFzLJPFzWDXu,O=d0SrinQXgiV2EPKZ81p78vsLJT49oUO2WWqwjzMvvtoct5Du8MrcO1xItiBI,L=ZYcpmmMv7XwZyqXzC9cUflrOro,ST=ET,C=ZB':
 Self-signed certificate encountered.
   WARNING: certificate common name 'cAvWp6IY477or7Zq58YWDDv9CMoGxeBN3l2zFFzLJPFzWDXu' doesn't match requested host name '194.106.166.22'.
2015-08-19 15:07:22 URL:https://194.106.166.22/AUv6.77.tar [431079/431079] -> "/dev/null" [1]
 
67.206.96.68 AUv6.77.tar failed: No route to host.
 
67.207.229.215 AUv6.77.tar WARNING: cannot verify 67.207.229.215's certificate, issued by 'CN=haL2vYd4uDwcGEmvxkMtgQHW,O=46NJb9RdBfLYEeehH4T9iq2CHx5Bg,L=QhHqeC6sZs,ST=BO,C=JC':
 Self-signed certificate encountered.
   WARNING: certificate common name 'haL2vYd4uDwcGEmvxkMtgQHW' doesn't match requested host name '67.207.229.215'.
2015-08-19 15:11:03 URL:https://67.207.229.215/AUv6.77.tar [431079/431079] -> "/dev/null" [1]
 
67.22.167.163 AUv6.77.tar failed: Operation timed out.
```

## Useful tips

1. Periodical infection can be analyzed by:compare Date to grep'/dev/null, like:
```
2015-08-27 00:32:21 URL:https://173.216.247.74/ar77.zip [434422/434422] -> "/dev/null" [1]
2015-08-27 00:32:30 URL:https://173.248.31.6/ar77.zip [434422/434422] -> "/dev/null" [1]
2015-08-27 00:32:45 URL:https://180.233.123.210/ar77.zip [434422/434422] -> "/dev/null" [1]
2015-08-27 00:32:58 URL:https://186.68.94.38/ar77.zip [434422/434422] -> "/dev/null" [1]
```
2. A sample to grep to monitor the rogue certification cycle used:
```
cat [RAW-RESULT.TXT]|grep 'certificate'|sed s/'WARNING\: cannot verify '//|grep 'issued by'
```
   result is like:
```
103.230.226.59's certificate, issued by 'CN=ELA5dx5SgQaNbe9,O=ejkiHMo6KSzSz67gtQpEyJ,L=UhzlBJ2GWd9NwmXoBIBBsRDDy7FNW,ST=BA,C=UQ':
109.86.226.85's certificate, issued by 'CN=QsvxokZhxdISZyJJFdZQkY9tw8,O=xmpuE0ktjU5kc1vL1WbF,L=qGVqF6XwTA1vhL,ST=CI,C=SQ':
112.133.203.43's certificate, issued by 'CN=ELA5dx5SgQaNbe9,O=ejkiHMo6KSzSz67gtQpEyJ,L=UhzlBJ2GWd9NwmXoBIBBsRDDy7FNW,ST=BA,C=UQ':
150.129.49.11's certificate, issued by 'CN=7ZNRS9n2EadRKsIEFD8MOsW4n,O=izTmH1EN84gyF4pO53X5SomZqi,L=VuhhndpqNy9GzYozjQt3pfn,ST=NZ,C=BA':
162.153.189.143's certificate, issued by 'emailAddress=support@ubnt.com,CN=UBNT,OU=Technical Support,O=Ubiquiti Networks Inc.,L=San Jose,ST=CA,C=US':
173.216.247.74's certificate, issued by 'CN=7ZNRS9n2EadRKsIEFD8MOsW4n,O=izTmH1EN84gyF4pO53X5SomZqi,L=VuhhndpqNy9GzYozjQt3pfn,ST=NZ,C=BA':
173.243.255.79's certificate, issued by 'CN=7ZNRS9n2EadRKsIEFD8MOsW4n,O=izTmH1EN84gyF4pO53X5SomZqi,L=VuhhndpqNy9GzYozjQt3pfn,ST=NZ,C=BA':
173.248.31.6's certificate, issued by 'CN=7ZNRS9n2EadRKsIEFD8MOsW4n,O=izTmH1EN84gyF4pO53X5SomZqi,L=VuhhndpqNy9GzYozjQt3pfn,ST=NZ,C=BA':
176.36.251.208's certificate, issued by 'emailAddress=support@ubnt.com,CN=UBNT,OU=Technical Support,O=Ubiquiti Networks Inc.,L=San Jose,ST=CA,C=US':
```
4. Crosschecking +alive routers* to *GeoIP* to seek infected location: 
i.e. example of infectious routers in United States by grep result with '| US |'
```
(1): 173.216.247.74|173-216-247-74-brns.mid.dyn.suddenlink.net.|19108 | 173.216.0.0/16 | SUDDENLINK-COMMUNICA | US | suddenlink.com | Suddenlink Communications
(2): 173.243.255.79|173.243.240.79.rhinocommunications.net.|17306 | 173.243.240.0/20 | RISE-BROADBAND | US | jabbroadband.com | Jab Wireless Inc.
(3): 173.248.31.6|cameron-31-6.dsl.chibardun.net.|26472 | 173.248.24.0/21 | CHIBARDUN-TEL | US | mosaictelecom.net | Mosaic Telecom
(8): 208.117.68.78||16832 | 208.117.64.0/20 | SECOM-1 | US | secom.net | Secom Inc
(9): 216.254.231.11|watertownDHCP-11.216-254-231.knology.net.|12083 | 216.254.228.0/22 | WOW-INTERNET | US | knology.net | PrairieWave Cable Modem DHCP
(11): 24.148.217.188|user-0c99mds.cable.mindspring.com.|11426 | 24.148.192.0/19 | SCRR-11426 | US | earthlink.net | Earthlink Inc.
(12): 24.33.131.116|cpe-24-33-131-116.cinci.res.rr.com.|10796 | 24.33.128.0/18 | SCRR-10796 | US | twcable.com | Time Warner Cable Internet LLC
```

This data is shared for the clean up purpose. The other usage of this information will be required -
mentioning good people who help gathering samples in VirusTotal and on cleaning up this infection.

Monitoring scheme is scripted by @unixfreaxjp feel free to use under WTFPL license: http://www.wtfpl.net/about/
*The script is not maintained anymore*

I only decoded some binaries & the rest are good decoding effort thanks to '@Techhelplistcom' < credit.
Feel free to maintain this database to any of your "good purpose" (only), but please contribute an
 effort by at least contacting one ISP informing infection in their network for cleaning up request.

For questions please contact at malwaremustdie in twitter 
