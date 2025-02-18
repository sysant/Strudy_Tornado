#!/bin/sh
# 请替换掉你的阿里云个人镜像账镜像和密码
kubectl create secret docker-registry registry-ali-hz --namespace=default --docker-server=registry.cn-hangzhou.aliyuncs.com --docker-username=USER@aliyun.com --docker-password=PASSWORD
