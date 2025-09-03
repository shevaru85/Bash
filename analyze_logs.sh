#!/bin/bash
awk 'BEGIN{ print  "Отчет о логе веб-сервера" }' > report.txt
awk 'BEGIN{ print  "========================" }' >> report.txt
awk 'END{ print  "Общее количество запросов:" "\t" NR >> "report.txt" }' access.log
awk 'BEGIN{a=0} {if (!seen[$1]++) a=a+1} END{ print  "Количество уникальных IP-адресов:" "\t" a >> "report.txt" }' access.log
awk 'BEGIN{ print  "\n" }' >> report.txt
awk 'BEGIN{ print  "Количество запросов по методам:"  >> "report.txt" }'
awk 'BEGIN{a=0} {if ($6 ~/GET/) a=a+1} END{ print a " " "GET" >> "report.txt" }' access.log
awk 'BEGIN{a=0} {if ($6 ~/POST/) a=a+1} END{ print a " " "POST" >> "report.txt" }' access.log
awk 'BEGIN{ print  "\n" }' >> report.txt
awk '{ print $7} ' access.log | sort | uniq -c | sort -nr | head -n 1 | awk '{ print  "Самый популярный URL:"  "\t" $1 " " $2}' >> report.txt
echo "Отчет сохранен в файл report.txt"












