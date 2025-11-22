# Admin Python Self Highlight

一个VSCode扩展，用于自动高亮Python文件中第一个参数为`self`的非静态方法。

A VSCode extension that automatically highlights non-static methods in Python files where the first parameter is `self`.

## 功能特性 | Features

- [x] 自动检测Python文件中定义的方法 | Automatically detects method definitions in Python files
- [x] 高亮显示第一个参数为`self`的非静态方法名 | Highlights non-static methods where the first parameter is `self`
- [x] 忽略静态方法（`@staticmethod`装饰的方法）| Ignores static methods (decorated with `@staticmethod`)
- [x] 可自定义高亮颜色 | Customizable highlight colors
- [x] 可自定义背景色 | Customizable background color
- [x] 可通过设置启用/禁用功能 | Can be enabled/disabled through settings
- [x] 支持明暗主题 | Supports light and dark themes

## 安装 | Installation

### 从VSIX安装 | Install from VSIX
1. 下载最新的 `.vsix` 文件 | Download the latest `.vsix` file
2. 在VSCode中打开命令面板 (Ctrl+Shift+P) | Open Command Palette in VSCode (Ctrl+Shift+P)
3. 输入 "Extensions: Install from VSIX" | Type "Extensions: Install from VSIX"
4. 选择下载的 `.vsix` 文件 | Select the downloaded `.vsix` file
5. 重启VSCode | Restart VSCode

### 从市场安装 | Install from Marketplace
✅ **现已发布！| Now Published!**  
🔗 [VSCode Marketplace](https://marketplace.visualstudio.com/items?itemName=superadmini.admin-python-self-highlight)

## 使用方法 | Usage

安装扩展后，打开任何Python文件：
After installing the extension, open any Python file:

```python
class TestClass:
    def method1(self, param1, param2):  # ✅ 'self' 会被高亮 | 'self' will be highlighted
        """This method should be highlighted - first parameter is self"""
        pass
    
    @staticmethod
    def static_method(param1):  # ❌ 不会被高亮 - 静态方法 | Will NOT be highlighted - static method
        """This method should NOT be highlighted - it's static"""
        pass
    
    def method2(cls, param1):   # ❌ 不会被高亮 - 第一个参数是cls | Will NOT be highlighted - first parameter is cls
        """This method should NOT be highlighted - first parameter is cls"""
        pass
    
    @classmethod
    def class_method(cls, param1):  # ❌ 不会被高亮 - 类方法 | Will NOT be highlighted - class method
        """This method should NOT be highlighted - it's a class method"""
        pass
    
    def method3(self):  # ✅ 'self' 会被高亮 | 'self' will be highlighted
        """This method should be highlighted - first parameter is self"""
        pass

def standalone_function(param1):  # ❌ 不会被高亮 - 不是方法 | Will NOT be highlighted - not a method
    """This should NOT be highlighted - not a method"""
    pass
```

## 配置选项 | Configuration

在VSCode设置中可以配置以下选项：
The following options can be configured in VSCode settings:

### `adminPythonSelfHighlight.enabled`
- **类型 | Type:** `boolean`
- **默认值 | Default:** `true`
- **描述 | Description:** 启用/禁用高亮功能 | Enable/disable highlighting functionality

### `adminPythonSelfHighlight.highlightColor`
- **类型 | Type:** `string`
- **默认值 | Default:** `"#ff00ff"` (紫色 | Purple)
- **描述 | Description:** 高亮`self`参数的文字颜色 | Text color for highlighted 'self' parameter
- **示例 | Examples:** 
  - `"#ff00ff"` - 紫色 | Purple
  - `"#0000ff"` - 蓝色 | Blue  
  - `"#ff0000"` - 红色 | Red
  - `"#00ff00"` - 绿色 | Green

### `adminPythonSelfHighlight.backgroundColor`
- **类型 | Type:** `string`
- **默认值 | Default:** `"transparent"` (透明 | Transparent)
- **描述 | Description:** 高亮`self`参数的背景颜色 | Background color for highlighted 'self' parameter
- **示例 | Examples:**
  - `"transparent"` - 透明 | Transparent
  - `"#ff00ff20"` - 淡紫色背景 | Light purple background
  - `"#0000ff20"` - 淡蓝色背景 | Light blue background

## 开发 | Development

### 环境要求 | Requirements
- Node.js
- VSCode
- npm

### 安装依赖 | Install Dependencies
```bash
npm install
```

### 测试 | Test
```bash
npm test
```

### 打包 | Package
```bash
vsce package
```

## 发布 | Publishing

### 发布到市场 | Publish to Marketplace
```bash
vsce publish
```

### 手动打包 | Manual Package
```bash
zip -r admin-python-self-highlight-0.0.1.vsix extension/ extension.vsixmanifest
```

## 更新日志 | Changelog

### v0.0.1 (2025-11-22)
- ✨ 初始版本发布 | Initial release
- ✨ 自动高亮Python方法中的`self`参数 | Auto-highlight 'self' parameter in Python methods
- ✨ 支持自定义颜色 | Support custom colors
- ✨ 支持自定义背景色 | Support custom background color
- ✨ 忽略静态方法和类方法 | Ignore static and class methods
- ✨ 支持明暗主题 | Support light and dark themes

## 贡献 | Contributing

欢迎提交Issue和Pull Request！
Welcome to submit Issues and Pull Requests!

1. Fork 这个仓库 | Fork this repository
2. 创建你的特性分支 | Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. 提交你的更改 | Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 | Push to the branch (`git push origin feature/AmazingFeature`)
5. 打开一个Pull Request | Open a Pull Request

## 许可证 | License

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 链接 | Links

- **VSCode市场 | VSCode Marketplace:** [🔗 admin-python-self-highlight](https://marketplace.visualstudio.com/items?itemName=superadmini.admin-python-self-highlight)
- **GitHub仓库 | GitHub Repository:** [https://github.com/superadmini/admin-python-self-highlight](https://github.com/superadmini/admin-python-self-highlight)
- **发布者 | Publisher:** [superadmini](https://marketplace.visualstudio.com/publishers?target=VSCode&publisher=superadmini)

## 🌟 支持这个项目 | Support This Project

如果这个扩展对你有帮助，请考虑：
If this extension helps you, please consider:

⭐ **在GitHub上给个Star** | **Give it a Star on GitHub**  
👉 [GitHub Repository](https://github.com/superadmini/admin-python-self-highlight) - 点击右上角的⭐ | Click the ⭐ in the top right corner  

⭐ **在VSCode市场给个好评** | **Give it a good rating on VSCode Marketplace**  
👉 [VSCode Marketplace](https://marketplace.visualstudio.com/items?itemName=superadmini.admin-python-self-highlight) - 安装后给个5星好评 | Give it 5 stars after installation  

🐛 **报告Bug** | **Report Bugs**  
💡 **提出功能建议** | **Suggest Features**  

你的支持是我们持续改进的动力！
Your support motivates us to keep improving!

---

## 📊 项目状态 | Project Status

✅ **已发布 | Published**  
🎯 **版本 | Version:** 0.0.1  
📦 **下载 | Downloads:** 正在统计中... | Counting...  
⭐ **Star | Stars:** [点击这里给Star](https://github.com/superadmini/admin-python-self-highlight) | [Click here to Star]

---

**Made with ❤️ by [superadmini](https://github.com/superadmini)**