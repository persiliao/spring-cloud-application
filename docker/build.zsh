#!/bin/zsh

# 获取当前脚本的目录
SCRIPT_DIR="$(dirname "$(realpath "$0")")"
# 项目目录
PROJECT_DIR="$(dirname "${SCRIPT_DIR}")"
# 定义颜色常量
RED='\033[0;31m'   # 红色
GREEN='\033[0;32m' # 绿色
RESET='\033[0m'    # 重置颜色

# 函数：停止并删除容器
cleanup_container() {
  echo "Stopping and removing container: echo-service"
  docker stop echo-service && docker rm echo-service
}

# 函数：删除镜像
cleanup_image() {
  echo "Removing image: persiliao/echo-service:latest"
  docker rmi persiliao/echo-service:latest
}

# 函数：构建新的镜像
build_image() {
  echo "Building new image: persiliao/echo-service:latest"
  docker buildx build -t persiliao/echo-service:latest --load .
}

# 主执行流程
if cleanup_container > /dev/null 2>&1; then
  echo -e "${GREEN}Container cleaned up successfully.${RESET}"
else
  echo -e "${GREEN}No container to clean up.${RESET}"
fi

if cleanup_image > /dev/null 2>&1; then
  echo -e "${GREEN}Image removed successfully.${RESET}"
else
  echo -e "${GREEN}No image to remove.${RESET}"
fi

AppJarFile="${PROJECT_DIR}/target/echo-service.jar"

if [ ! -f "$AppJarFile" ]; then
  echo -e "${RED}Please compile the project first.${RESET}"
  exit 1
fi

cp "$AppJarFile" .

if build_image; then
  echo -e "${GREEN}Image built successfully!${RESET}"
else
  echo -e "${RED}Failed to build image.${RESET}"
  exit 1
fi

echo -e "${GREEN}Process completed successfully! ${RESET}"