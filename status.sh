#!/bin/bash

# 定义颜色
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # 没有颜色

# 查找当前目录及其子目录下的所有.git目录
find . -type d -name ".git" | while read gitdir; do
    # 获取.git目录的父目录，即仓库的根目录
    repo_root=$(dirname "$gitdir")
    echo -e "${BLUE}检查仓库:${NC} $repo_root"
    
    # 进入仓库根目录
    cd "$repo_root" > /dev/null
    
    # 检查未提交文件的状态
    # 如果有未提交的更改，打印这些更改
    if output=$(git status --porcelain) && [ ! -z "$output" ]; then
        echo -e "${RED}未提交文件状态:${NC}"
        echo "$output"
    else
        echo -e "${GREEN}所有更改都已提交。${NC}"
    fi
    
    # 返回脚本所在的原始目录
    cd - > /dev/null
    echo
done

echo -e "${BLUE}所有仓库检查完毕。${NC}"