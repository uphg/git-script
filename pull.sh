#!/bin/bash

# 替换以下用户名为你的 GitHub 用户名
GITHUB_USERNAME="<your_github_username>"

# 仓库名数组列表
repos=("repo1" "repo2" "repo3")

# 克隆或更新仓库
for repo in "${repos[@]}"; do
  # 检查目录是否存在
  if [ -d "$repo" ]; then
    echo "更新仓库: $repo"
    cd "$repo"
    git pull
    cd ..
  else
    echo "克隆仓库: $repo"
    git clone "https://github.com/$GITHUB_USERNAME/$repo.git"
  fi
done

echo "操作完成。"