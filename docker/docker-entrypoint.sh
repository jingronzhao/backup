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

echo -e "容器启动成功...\n"

crond -f

exec "$@"
