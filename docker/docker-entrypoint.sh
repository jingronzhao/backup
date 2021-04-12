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
bash $JD_DIR/jd.sh update
echo


echo -e "========================3. 启动控制面板========================\n"
if [[ ${ENABLE_WEB_PANEL} == true ]]; then
  pm2 start $dir_panel/ttyd --name="WebShell" -- -p 9999 -t fontSize=14 -t disableLeaveAlert=true -t rendererType=webgl bash
  pm2 start $JD_DIR/panel/server.js
  echo -e "控制面板启动成功...\n"
  echo -e "如未修改用户名密码，则初始用户名为：admin，初始密码为：adminadmin\n"
  echo -e "请访问 http://<ip>:5678 登陆并修改配置...\n"
elif [[ ${ENABLE_WEB_PANEL} == false ]]; then
  echo -e "已设置为不自动启动控制面板，跳过...\n"
fi
echo -e "容器启动成功...\n"


crond -f

exec "$@"
