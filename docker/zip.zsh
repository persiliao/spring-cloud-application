#!/usr/bin/env zsh

# 获取当前脚本的目录
SCRIPT_DIR="$(dirname "$(realpath "$0")")"
# 项目目录
PROJECT_DIR="$(dirname "${SCRIPT_DIR}")"
DEPLOY_TAR_DIR="${HOME}/Desktop/SpringCloudGateway/Deploy/$(date +"%m%d")"
PACKAGE_FILE="$PROJECT_DIR/target/spring-cloud-gateway.jar"
# 定义颜色常量
RED='\033[0;31m'   # 红色
GREEN='\033[0;32m' # 绿色
RESET='\033[0m'    # 重置颜色

if [ ! -f "$PACKAGE_FILE" ]; then
  echo -e "$RED请先执行package!$RESET"
  exit 1
fi

mkdir -p "$DEPLOY_TAR_DIR"

ZIP_FILE="$DEPLOY_TAR_DIR/spring-cloud-gateway.zip"

if zip -j "$ZIP_FILE" "$PACKAGE_FILE"; then
    echo -e "$GREEN打包成功，压缩文件路径：file://$DEPLOY_TAR_DIR$RESET"
    rm -rf "$PACKAGE_FILE"
else
    echo -e "$RED打包失败$RESET"
    exit 1
fi