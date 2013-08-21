#!/bin/bash
clear

echo "> Proxy Scanner (By Psycho)"
echo "========================================"
echo ""
echo "> Proxy Scanner (By Psycho)" > proxies.txt
echo "========================================" >> proxies.txt
echo "" >> proxies.txt


for (( i=1; i <= 255; i++ ))
do
	for (( j=1; j <= 255; j++ ))
	do
		proxy=$(echo "192.168.$i.$j:8080")
		export http_proxy="$proxy"
		export https_proxy="$proxy"
		
		echo -n "Using" $proxy
		echo -n "Using" $proxy >> proxies.txt
		
		wget google.com -q -t1 -T7
		status=$?

		if [[ $status -ne 0 ]];then
			echo -e "  \tFailed" 
			echo -e "  \tFailed" >> proxies.txt
		else
			echo -e "  \tSuccess"
			echo -e "  \tSuccess" >> proxies.txt
		fi
	done
done

echo ""
echo "Done!"

### OTHER CODE #####
# oldproxy=$(echo $http_proxy)
# echo "Current Proxy: " $oldproxy
# substr=$(echo $oldproxy | cut -d"." -f4 | cut -d":" -f1)
# newproxy=$(echo "192.168.2."$(($substr + 1))":8080")