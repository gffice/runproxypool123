#!/bin/bash

# 等待指定内容的出现并输出消息
echo "等待指定内容的出现..."
while ! grep -q "Usablility" runlog.txt; do
  echo "no find"
  sleep 5
done
echo "检测到指定内容，即将执行命令。"
sleep 10
mkdir http
cd http
curl http://0.0.0.0:8080/
curl http://0.0.0.0:8080/clash
curl http://0.0.0.0:8080/clash/config
curl http://0.0.0.0:8080/clash/proxies
curl http://0.0.0.0:8080/shadowrocket
curl http://0.0.0.0:8080/surge/config
curl http://0.0.0.0:8080/surge
curl http://0.0.0.0:8080/surge/proxies
curl http://0.0.0.0:8080/ss/sub
curl http://0.0.0.0:8080/sip002/sub
curl http://0.0.0.0:8080/sip002/sub
curl http://0.0.0.0:8080/vmess/sub
curl http://0.0.0.0:8080/trojan/sub
killall runproxypool #运行的命令
