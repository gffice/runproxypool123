#!/bin/bash
while true
do
  if grep -Fxq "100.0% DONE" ./runlog.txt
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
  echo no find
  cat ./runlog.txt
  sleep 5 #每隔5秒检查一次文件
done



#!/bin/bash

# 读取参数，第一个参数为需要监测的程序名称，第二个参数为需要显示的内容
program_name=runproxypool
display_text=Usablility

# 使用 pgrep 命令来检测程序是否正在运行，并获取该程序的 PID
pid=$(pgrep $program_name)

if [ -z $pid ]; then
  # 如果 PID 为空，则说明程序没有运行，直接退出脚本
  echo "$program_name is not running"
  exit 1
else
  # 如果程序正在运行，则查找程序的输出信息中是否包含指定的内容
  output=$(ps -p $pid -o comm=)
  for [[ $output == *$display_text* ]]; then
    # 如果输出信息中包含指定的内容，则执行指定的命令
    echo "Running command..."
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
    #command_to_run=<PLACE YOUR COMMAND HERE>
    #$command_to_run
    # 如果输出信息中不包含指定的内容，则直接退出脚本
    #echo "'$program_name' is running, but the specified text is not found in its output"
    #sleep 5
    fi
    echo "'$program_name' is running, but the specified text is not found in its output"
    sleep 5
  done
fi
