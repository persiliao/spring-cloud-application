#!/bin/bash

# 定义颜色常量
RED='\033[0;31m'   # 红色
GREEN='\033[0;32m' # 绿色
RESET='\033[0m'    # 重置颜色

# 获取当前脚本的目录
SCRIPT_DIR="$(dirname "$(realpath "$0")")"
# 项目目录
PROJECT_DIR="$(dirname "${SCRIPT_DIR}")"

# 检查 Maven 环境
if ! type "mvn" > /dev/null; then
  echo -e "${RED}Maven is not installed or not found in PATH.${RESET}"
  exit 1
fi

export ECHO_GATEWAY_PORT=8888
# 检测占用该端口的进程
PID=$(lsof -t -i :$ECHO_GATEWAY_PORT)

# 判断是否找到了进程ID
if [ -n "$PID" ]; then
    echo "端口 $PORT 被占用, 进程ID: $PID, 正在终止该进程..."
    kill -9 "$PID"
    echo "进程已被终止。"
fi

# 使用 Maven 运行 Spring Boot 应用
echo "Starting Spring Boot application using Maven..."
if mvn -f "${PROJECT_DIR}/pom.xml" spring-boot:run; then
  echo -e "${GREEN}Spring Boot application is running successfully!${RESET}"
else
  echo -e "${RED}Failed to run Spring Boot application with Maven.${RESET}"
  exit 1
fi