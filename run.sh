#!/bin/bash
while true
do
  if grep -Fxq "INFO Usablility checking done." runlog.txt
  then
    sleep 30
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
  fi
  sleep 5 #每隔5秒检查一次文件
done
