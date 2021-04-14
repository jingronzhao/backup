#!/usr/bin/env bash

## Author: lan-tianxiang
## Source: https://github.com/lan-tianxiang/js_tool
## Modified： 2021-03-27
## Version： v0.0.2

dir_shell=$(dirname $(readlink -f "$0"))
dir_root=$dir_shell
dir_config=$dir_root/config
file_cookie=$dir_config/cookie.sh

[ -s $file_cookie ] && cp $file_cookie $(dirname $dir_shell)/cookie.sh
pkill -9 node
bash $dir_shell/jd.sh paneloff
rm -rf $dir_shell
cd $(dirname $dir_shell)

function REINSTALLATION() {
  echo -e "\n1. 获取源码"

  git clone https://gitee.com/highdimen/js_tool.git $dir_shell

  echo -e "\n2. 还原配置文件"

  [ -f $(dirname $dir_shell)/cookie.sh ] && cp $(dirname $dir_shell)/cookie.sh $file_cookie && rm -rf $(dirname $dir_shell)/cookie.sh

  echo -e "\n3. 执行脚本更新以及定时文件更新"
  npm config set registry https://registry.npm.taobao.org
  bash $dir_shell/jd.sh update

  echo -e "\n修复完成！！！！"
}

REINSTALLATION
