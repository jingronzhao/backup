#!/bin/bash
set -e

echo -e "\n======================== 1. 检测文件夹 ========================\n"
if [ ! -d $JD_DIR/config ]; then
  echo -e "没有映射config配置目录给本容器，在容器内创建该文件夹\n"
  mkdir -p /root/jd/config
fi
if [ ! -d $JD_DIR/log ]; then
  echo -e "没有映射log日志目录给本容器，在容器内创建该文件夹\n"
  mkdir -p /root/jd/log
fi
if [ ! -d $JD_DIR/thirdpard ]; then
  echo -e "没有映射thirdpard脚本目录给本容器，在容器内创建该文件夹\n"
  mkdir -p /root/jd/thirdpard
fi

crond

echo -e "\n======================== 2. 更新源代码 ========================\n"
jd update
echo

crontab $JD_DIR/config/crontab.list

echo -e "========================3. 启动挂机程序========================\n"
if [[ $ENABLE_HANGUP == true ]]; then
  . $JD_DIR/config/cookie.sh
  if [ -n "${Cookie1}" ]; then
    jd hangup
    echo -e "挂机程序启动成功...\n"
  else
    echo -e "config.sh中还未填入有效的Cookie，可能是首次部署容器，因此不启动挂机程序...\n"
  fi
elif [[ $ENABLE_HANGUP == false ]]; then
  echo -e "已设置为不自动启动挂机程序，跳过...\n"
fi

echo -e "========================4. 启动控制面板========================\n"
if [[ $ENABLE_WEB_PANEL == true ]]; then
  jd panelon
  jd panelon
elif [[ $ENABLE_WEB_PANEL == false ]]; then
  echo -e "已设置为不自动启动控制面板，跳过...\n"
fi
echo -e "容器启动成功...\n"

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
  set -- node "$@"
fi

exec "$@"
