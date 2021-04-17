#!/bin/bash
set -e


crond

  [ ! -f $JdDir/config/config.sh ] && cp -f $JdDir/sample/config.sh.sample $JdDir/config/config.sh
  [ ! -f $JdDir/config/cookie.sh ] && cp -f $JdDir/sample/cookie.sh.sample $JdDir/config/cookie.sh
  [ ! -f $JdDir/config/crontab.list ] && cp -f $$JdDir/sample/crontab.list.sample $JdDir/config/crontab.list
  [ ! -f $JdDir/config/sharecode.sh ] && cp -f $JdDir/sample/sharecode.sh.sample $JdDir/config/sharecode.sh

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
