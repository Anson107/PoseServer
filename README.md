# 《我和AI一起学射箭》综合训练系统（Node.js + React 重构版）

仓库名：PoseServer。
这是一个《我和AI一起学射箭》综合训练系统，包括姿态标注、模型训练、实时评分以及数据采集模块。

## 1. 项目结构

- `frontend`：React + Vite 前端
- `backend_rebuild_isolated`：Node.js + Express 后端
- `backend_rebuild_isolated/data/dataset`：数据集图片
- `backend_rebuild_isolated/data/labels`：标注结果
- `backend_rebuild_isolated/data/models`：训练模型参数

## 2. 环境要求

- Node.js >= 20（当前已在 Node.js 24 验证）
- Windows / macOS / Linux 均可

## 3. 快速启动（推荐）

双击根目录 `一键启动.bat`。

脚本会自动：
1. 安装根依赖、后端依赖、前端依赖
2. 构建前端
3. 启动后端服务（默认 `http://localhost:7766`）

启动后在浏览器访问：

- `http://localhost:7766`

## 4. 开发模式启动

双击根目录 `开发模式启动.bat`。

- 前端：`http://localhost:5173`
- 后端：`http://localhost:7766`

## 5. 功能说明

### 姿态标注

- 导入文件夹（支持批量图片上传）
- 导入已有数据目录（例如工作区中的 `image_9d925a664d874edcad26d6e545f56257`）
- 自动关键点检测
- 滑条打分并保存
- 上一张/下一张浏览

### 模型训练

- 训练参数：树数量、最大深度、最小叶子样本
- 随机森林回归训练
- 模型性能展示（MAE、深度）
- 特征重要性 Top10
- 森林列表与单树结构预览
- 模型导入/导出

### 实时评分

- 导入模型后开启摄像头
- 随机森林评分 / 规则评分切换
- 实时关键点覆盖显示
- 实时分数与截图

### 数据集采集（新增）

- 调用摄像头拍照
- 保存原图到数据集目录
- 自动进入姿态标注列表

## 6. 常见问题

1. 摄像头无法打开
   - 检查浏览器摄像头权限是否允许
2. 首次姿态检测较慢
   - 前端会首次加载 TensorFlow 模型，属于正常现象
3. 端口冲突
   - 本系统默认使用 `7766`，可通过环境变量 `PORT` 覆盖
