#!/bin/bash

FILE_SUFFIX="battle.log"
FIND_STR="Cheat!"

function read_dir() {
  #注意此处这是两个反引号，表示运行系统命令
  for file in $(ls $1); do
    if [ -d $1"/"$file ]; then #注意此处之间一定要加上空格，否则会报错
      read_dir $1"/"$file
    else
      if [[ $file == *$FILE_SUFFIX* ]]; then
        file_path=$1"/"$file
        # echo ">>>" $file_path #在此处处理文件即可
        count=$(grep -c $FIND_STR "$file_path")
        if [ $count -ne '0' ]; then
          echo "### Cheat! count=$count $file_path"
        fi
      fi
    fi
  done
}
#读取第一个参数
read_dir logs
