# 发布 Admin Python Self Highlight 扩展

## 当前状态
✅ VSIX 文件已创建: `admin-python-self-highlight-0.0.1.vsix`
❌ 自动发布失败 (Node.js 版本兼容性问题)

## 手动发布步骤

### 方法 1: 使用 VSCode Marketplace 网页界面

1. 访问 [VSCode Marketplace 管理页面](https://marketplace.visualstudio.com/manage)
2. 使用您的 Microsoft 账户登录
3. 点击 "Create new publisher" 或选择现有发布者
   - 发布者名称: `superadmini`
4. 点击 "Publish extension" 
5. 上传 VSIX 文件: `admin-python-self-highlight-0.0.1.vsix`
6. 填写扩展信息:
   - 扩展名称: Admin Python Self Highlight
   - 扩展 ID: admin-python-self-highlight
   - 描述: Automatically highlights non-static methods in Python files where first parameter is 'self'
   - 分类: Other
7. 点击 "Publish" 完成发布

### 方法 2: 使用 Personal Access Token

1. 在 [Azure DevOps](https://dev.azure.com) 创建 Personal Access Token
2. 设置环境变量:
   ```bash
   export VSCE_PAT="your_personal_access_token"
   ```
3. 运行发布脚本:
   ```bash
   ./manual-publish.sh
   ```

### 方法 3: 升级 Node.js 版本

1. 安装 Node.js 18+ 版本:
   ```bash
   # 使用 nvm
   nvm install 18
   nvm use 18
   ```
2. 重新安装 vsce:
   ```bash
   npm install -g @vscode/vsce
   ```
3. 发布扩展:
   ```bash
   vsce publish
   ```

## 扩展信息

- **发布者**: superadmini
- **扩展名称**: admin-python-self-highlight
- **版本**: 0.0.1
- **VSIX 文件**: admin-python-self-highlight-0.0.1.vsix (192 KB)
- **GitHub 仓库**: https://github.com/superadmini/admin-python-self-highlight

## 发布后

发布成功后，扩展将可在以下地址访问:
https://marketplace.visualstudio.com/items?itemName=superadmini.admin-python-self-highlight

## 故障排除

如果发布失败，请检查:
1. package.json 中的发布者名称是否正确
2. VSIX 文件是否完整
3. Personal Access Token 是否有效
4. 网络连接是否正常