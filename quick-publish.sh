#!/bin/bash

# Quick Publish Script - 快速发布脚本
# 直接发布到VSCode市场，跳过确认

echo "⚡ Quick publishing Admin Python Self Highlight extension..."

# 运行lint检查
npm run lint
if [ $? -ne 0 ]; then
    echo "❌ Lint check failed!"
    exit 1
fi

# 复制文件
cp extension.js extension/
cp package.json extension/
cp README.md extension/
cp -r images extension/

# 直接发布
echo "🚀 Publishing to VSCode Marketplace..."
vsce publish

if [ $? -eq 0 ]; then
    echo "✅ Published successfully!"
    echo "🌐 https://marketplace.visualstudio.com/items?itemName=superadmini.admin-python-self-highlight"
else
    echo "❌ Publish failed!"
    exit 1
fi