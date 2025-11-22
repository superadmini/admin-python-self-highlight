#!/bin/bash

# Admin Python Self Highlight - 发布脚本
# 使用 curl 直接发布到 VSCode Marketplace

echo "🚀 发布 Admin Python Self Highlight 扩展..."

# 检查 VSIX 文件是否存在
VSIX_FILE="admin-python-self-highlight-0.0.1.vsix"
if [ ! -f "$VSIX_FILE" ]; then
    echo "❌ 错误: VSIX 文件 $VSIX_FILE 不存在"
    exit 1
fi

echo "📦 找到 VSIX 文件: $VSIX_FILE"

# 检查是否有 Personal Access Token
if [ -z "$VSCE_PAT" ]; then
    echo "⚠️  请设置 VSCE_PAT 环境变量为您的 VSCode Marketplace Personal Access Token"
    echo "   或者手动上传文件: $VSIX_FILE"
    echo "   上传地址: https://marketplace.visualstudio.com/manage"
    exit 1
fi

echo "✅ 开始上传到 VSCode Marketplace..."

# 使用 curl 上传
response=$(curl -X PUT \
  -H "Authorization: Bearer $VSCE_PAT" \
  -H "Content-Type: application/octet-stream" \
  --data-binary @"$VSIX_FILE" \
  "https://marketplace.visualstudio.com/_apis/gallery/publishers/superadmini/vsextensions/admin-python-self-highlight/0.0.1/vspackage")

echo "📤 发布响应:"
echo "$response"

# 检查响应
if echo "$response" | grep -q "error"; then
    echo "❌ 发布失败，请检查错误信息"
    exit 1
else
    echo "✅ 发布成功！"
    echo "🔗 扩展地址: https://marketplace.visualstudio.com/items?itemName=superadmini.admin-python-self-highlight"
fi