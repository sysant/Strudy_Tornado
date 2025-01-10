#!/bin/bash
export LC_ALL=zh_CN.UTF-8
File="/root/ShuangSeQiu/templates/report.html"
geoip="/etc/goaccess/GeoLite2-City.mmdb"
log="/www/wwwlogs/www.taiguqixing.com.log"
goaccess ${log} --geoip-database=${geoip} --log-format='%h %^[%d:%t %^] "%r" %s %b "%R" "%u"' --date-format='%d/%b/%Y' --time-format='%T' -o ${File}
