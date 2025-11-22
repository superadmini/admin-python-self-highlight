# Admin Python Self Highlight

一个VSCode扩展，用于自动高亮Python文件中第一个参数为`self`的非静态方法。

## 功能特性

- 自动检测Python文件中定义的方法
- 高亮显示第一个参数为`self`的非静态方法名
- 忽略静态方法（`@staticmethod`装饰的方法）
- 可自定义高亮颜色
- 可通过设置启用/禁用功能

## 使用方法

1. 安装扩展后，打开任何Python文件
2. 扩展会自动检测并高亮符合条件的方法
3. 鼠标悬停在高亮的方法名上会显示提示信息

## 配置选项

在VSCode设置中可以配置以下选项：

- `adminPythonSelfHighlight.enabled`: 启用/禁用高亮功能（默认: true）
- `adminPythonSelfHighlight.highlightColor`: 高亮背景颜色（默认: rgba(255, 255, 0, 0.2)）

## 示例

```python
class MyClass:
    def method1(self, param1):  # 会被高亮 - 第一个参数是self
        pass
    
    @staticmethod
    def static_method(param1):  # 不会被高亮 - 静态方法
        pass
    
    def method2(cls, param1):   # 不会被高亮 - 第一个参数不是self
        pass
```

## 开发

### 环境要求

- Node.js
- VSCode
- npm

### 安装依赖

```bash
npm install
```

### 测试

```bash
npm test
```

### 打包

```bash
vsce package
```

## 发布

1. 更新package.json中的版本号
2. 运行打包命令
3. 上传到VSCode市场

## 许可证

MIT