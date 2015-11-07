head -100 top-1m.csv| awk -F "\"*,\"*" '{print $2}' |
while read line; do
	ipv4=$(ping -c 5 "www.$line" | tail -1| awk -F '/' '{print $5}');
	ipv6=$(ping6 -c 5 "www.$line" | tail -1| awk -F '/' '{print $5}');
	echo "$line,$ipv4,$ipv6"
done > newresults.csv

