#!/bin/zsh

# 定义颜色常量
RED='\033[0;31m'   # 红色
GREEN='\033[0;32m' # 绿色
RESET='\033[0m'    # 重置颜色

# 读取镜像名称和标签
IMAGE_NAME=${1:-persiliao/echo-service} # 第一个参数
IMAGE_TAG=${2:-latest} # 第二个参数

# 函数：构建并推送 Docker 镜像
build_and_push_image() {
  echo "Building and pushing Docker image: ${IMAGE_NAME}:${IMAGE_TAG} for platforms: linux/amd64, linux/arm64"
  docker buildx build --platform linux/amd64,linux/arm64 -t "${IMAGE_NAME}":"${IMAGE_TAG}" --push .
}

# Docker 登录（可选）
echo "Logging into Docker Hub..."
docker login

# 主执行流程
if build_and_push_image; then
  echo -e "${GREEN}Docker image ${IMAGE_NAME}:${IMAGE_TAG} built and pushed successfully!${RESET}"
else
  echo -e "${RED}Failed to build and push Docker image.${RESET}"
  exit 1
fi