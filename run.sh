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
mkdir clash
mkdir shadowrocket
mkdir surge
mkdir ss
mkdir sip002
mkdir vmess
mkdir trojan
curl -o index.html http://0.0.0.0:8080/
curl -o ./clash/index.html http://0.0.0.0:8080/clash
curl -o ./clash/config http://0.0.0.0:8080/clash/config
curl -o ./clash/proxies http://0.0.0.0:8080/clash/proxies
curl -o ./shadowrocket/index.html http://0.0.0.0:8080/shadowrocket
curl -o ./surge/config http://0.0.0.0:8080/surge/config
curl -o ./surge/index.html http://0.0.0.0:8080/surge
curl -o ./surge/proxies http://0.0.0.0:8080/surge/proxies
curl -o ./ss/sub http://0.0.0.0:8080/ss/sub
curl -o ./sip002/sub http://0.0.0.0:8080/sip002/sub
curl -o ./ssr/sub http://0.0.0.0:8080/ssr/sub
curl -o ./vmess/sub http://0.0.0.0:8080/vmess/sub
curl -o ./trojan/sub http://0.0.0.0:8080/trojan/sub
killall runproxypool #运行的命令
