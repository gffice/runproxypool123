#!/bin/bash
while true
do
  if grep -Fxq "指定字符" 文件名.txt
  then
    运行的命令
    killall wget
  fi
  sleep 5 #每隔5秒检查一次文件
done
