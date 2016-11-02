#!/bin/bash
#
# commands for getting infos from log file

cat *_020.log | jq -r '"\(.impression.cp)\t\(.impression.il.impLocationURL)\t\(.impression.il.impLocationRef)\t\(.general.dv)\t\(.general.tz)\t\(.general.ip)\t\(.general.ts)\t\(.session.gid)"' | awk '$1=="花旗寰旅世界卡C_20160922"||$1=="花旗寰旅世界卡D_20160922"||$1=="花旗寰旅世界卡_20160901"||$1=="花旗寰旅世界卡_20160912"||$1=="花旗寰旅世界卡_20160913"||$1=="長榮開航宣告_20160830"{print $0}' >> travel_impression_1012to1028.txt &
