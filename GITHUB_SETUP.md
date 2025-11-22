# GitHub Repository Setup Guide

## 1. 创建GitHub仓库 | Create GitHub Repository

1. 访问 [GitHub](https://github.com) | Visit [GitHub](https://github.com)
2. 点击 "New repository" | Click "New repository"
3. 仓库名称 | Repository name: `admin-python-self-highlight`
4. 描述 | Description: `VSCode extension that highlights 'self' parameter in Python methods`
5. 设为公开仓库 | Set as Public repository
6. 不要添加README、.gitignore、license（我们已有了）| Don't add README, .gitignore, license (we already have them)
7. 点击 "Create repository" | Click "Create repository"

## 2. 连接本地仓库到远程 | Connect Local to Remote

```bash
# 添加远程仓库 | Add remote repository
git remote add origin https://github.com/superadmini/admin-python-self-highlight.git

# 推送到GitHub | Push to GitHub
git push -u origin master
```

## 3. 设置GitHub Pages | Setup GitHub Pages

1. 进入仓库设置 | Go to repository settings
2. 找到 "Pages" 部分 | Find "Pages" section
3. Source: 选择 "Deploy from a branch" | Choose "Deploy from a branch"
4. Branch: 选择 "master" 和 "/ (root)" | Select "master" and "/ (root)"
5. 点击 "Save" | Click "Save"

## 4. 添加GitHub Actions（可选）| Add GitHub Actions (Optional)

创建 `.github/workflows/release.yml` | Create `.github/workflows/release.yml`:

```yaml
name: Release

on:
  push:
    tags:
      - 'v*'

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-node@v2
        with:
          node-version: '16'
      - run: npm ci
      - run: npm run lint
      - run: vsce package
      - run: vsce publish
        env:
          VSCE_PAT: ${{ secrets.VSCE_PAT }}
```

## 5. 设置Secrets | Setup Secrets

1. 进入仓库设置 > Secrets | Go to repository settings > Secrets
2. 添加新的secret | Add new secret:
   - Name: `VSCE_PAT`
   - Value: 你的VSCode Personal Access Token | Your VSCode Personal Access Token

## 6. 发布流程 | Publishing Flow

### 手动发布 | Manual Publish:
```bash
./publish.sh
```

### 快速发布 | Quick Publish:
```bash
./quick-publish.sh
```

### 自动发布（通过标签）| Auto Publish (via tags):
```bash
git tag v0.0.2
git push origin v0.0.2
```

## 7. 推广链接 | Promotion Links

### README中的链接 | Links in README:
- GitHub: https://github.com/superadmini/admin-python-self-highlight
- Marketplace: https://marketplace.visualstudio.com/items?itemName=superadmini.admin-python-self-highlight
- Issues: https://github.com/superadmini/admin-python-self-highlight/issues

### 社交媒体推广 | Social Media:
- Twitter/X: 发布新版本通知 | Post release announcements
- Reddit: r/vscode, r/python | Share with communities
- Stack Overflow: 回答相关问题时提及 | Mention when answering related questions

## 8. 维护建议 | Maintenance Tips

1. **定期更新** | Regular Updates:
   - 修复bug | Fix bugs
   - 添加新功能 | Add new features
   - 更新依赖 | Update dependencies

2. **社区互动** | Community Engagement:
   - 及时回复Issues | Respond to issues promptly
   - 感谢Star用户 | Thank users who star the repo
   - 处理Pull Requests | Review and merge PRs

3. **文档维护** | Documentation:
   - 更新README | Keep README updated
   - 添加使用示例 | Add usage examples
   - 记录API变更 | Document API changes

4. **版本管理** | Version Management:
   - 语义化版本 | Semantic versioning
   - 更新日志 | Changelog
   - 发布说明 | Release notes