#!/bin/bash

# 等待指定内容的出现并输出消息
echo "等待指定内容的出现..."
while ! grep -q "Usablility" runlog.txt; do
  echo "no find"
  sleep 5
done
echo "检测到指定内容，即将执行命令。"
sleep 60
mkdir docs
cd docs
mkdir clash
mkdir shadowrocket
mkdir surge
mkdir ss
mkdir ssr
mkdir sip002
mkdir vmess
mkdir trojan
mkdir static
mkdir clash/static
mkdir shadowrocket/static
mkdir surge/static
wget -O index.html http://0.0.0.0:8080/
wget -O ./clash/index.html http://0.0.0.0:8080/clash
wget -O ./clash/config http://0.0.0.0:8080/clash/config
wget -O ./clash/proxies http://0.0.0.0:8080/clash/proxies
wget -O ./shadowrocket/index.html http://0.0.0.0:8080/shadowrocket
wget -O ./surge/config http://0.0.0.0:8080/surge/config
wget -O ./surge/index.html http://0.0.0.0:8080/surge
wget -O ./surge/proxies http://0.0.0.0:8080/surge/proxies
wget -O ./ss/sub http://0.0.0.0:8080/ss/sub
wget -O ./sip002/sub http://0.0.0.0:8080/sip002/sub
wget -O ./ssr/sub http://0.0.0.0:8080/ssr/sub
wget -O ./vmess/sub http://0.0.0.0:8080/vmess/sub
wget -O ./trojan/sub http://0.0.0.0:8080/trojan/sub
wget -O ./static/index.js http://0.0.0.0:8080/static/index.js
cd ..
cp ./jquery.js ./docs/jquery.js
cp ./index.js ./docs/index.js
cp ./index.css ./docs/index.css
cp ./metron-icon.css ./docs/metron-icon.css
cd docs
cp ./static/index.js ./clash/static/index.js
cp ./static/index.js ./shadowrocket/static/index.js
cp ./static/index.js ./surge/static/index.js
sleep 60
killall runproxypool #运行的命令
