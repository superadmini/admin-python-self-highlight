#!/bin/bash

# Admin Python Self Highlight Extension Publish Script
# 发布脚本 - 发布到VSCode插件市场

echo "🚀 Starting publish process for Admin Python Self Highlight extension..."

# 检查是否安装了vsce
if ! command -v vsce &> /dev/null; then
    echo "📦 Installing vsce..."
    npm install -g vsce
fi

# 运行lint检查
echo "🔍 Running lint check..."
npm run lint
if [ $? -ne 0 ]; then
    echo "❌ Lint check failed. Please fix the issues before publishing."
    exit 1
fi

# 确保所有文件都已复制到extension目录
echo "📋 Copying files to extension directory..."
cp extension.js extension/
cp package.json extension/
cp README.md extension/
cp -r images extension/

# 创建vsix包
echo "📦 Creating VSIX package..."
vsce package

if [ $? -eq 0 ]; then
    echo "✅ VSIX package created successfully!"
else
    echo "❌ Failed to create VSIX package."
    exit 1
fi

# 询问是否发布到市场
echo ""
echo "📋 Package created. Do you want to publish to VSCode Marketplace?"
echo "   Make sure you have a Personal Access Token configured."
read -p "Publish to marketplace? (y/N): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🚀 Publishing to VSCode Marketplace..."
    vsce publish
    
    if [ $? -eq 0 ]; then
        echo "✅ Successfully published to VSCode Marketplace!"
        echo ""
        echo "🌐 Extension URL: https://marketplace.visualstudio.com/items?itemName=superadmini.admin-python-self-highlight"
        echo "📦 Repository: https://github.com/superadmini/admin-python-self-highlight"
        echo ""
        echo "🎉 Don't forget to:"
        echo "   ⭐ Star the repository on GitHub"
        echo "   ⭐ Rate the extension on VSCode Marketplace"
        echo "   🐛 Report any issues you find"
        echo "   💡 Suggest new features"
    else
        echo "❌ Failed to publish to marketplace."
        exit 1
    fi
else
    echo "📦 Package created but not published."
    echo "   You can publish manually with: vsce publish"
    echo "   Or install locally: code --install-extension admin-python-self-highlight-*.vsix"
fi

echo ""
echo "✅ Publish process completed!"