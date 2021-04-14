#!/bin/bash
set -e

echo -e "\n======================== 1. 检测文件夹 ========================\n"
if [ ! -d $JD_DIR/config ]; then
  echo -e "没有映射config配置目录给本容器，在容器内创建该文件夹\n"
  mkdir -p /jd/config
fi
if [ ! -d $JD_DIR/log ]; then
  echo -e "没有映射log日志目录给本容器，在容器内创建该文件夹\n"
  mkdir -p /jd/log
fi
if [ ! -d $JD_DIR/thirdpard ]; then
  echo -e "没有映射thirdpard脚本目录给本容器，在容器内创建该文件夹\n"
  mkdir -p /jd/thirdpard
fi

echo -e "\n======================== 2. 更新源代码 ========================\n"
jd update
echo

echo -e "========================3. 启动控制面板========================\n"
if [[ $ENABLE_WEB_PANEL == true ]]; then
  jd panelon
  jd panelon
elif [[ $ENABLE_WEB_PANEL == false ]]; then
  echo -e "已设置为不自动启动控制面板，跳过...\n"
fi
echo -e "容器启动成功...\n"

crond -f

exec "$@"
