---
title: Windows常用系统命令
categories:
  - 工具
tag:
  - windows
---



# Windows Command

> 常用的 windows 系统命令
>
> `win + r` 打开运行窗口，输入 cmd，回车确定，进入命令窗口

<!-- more -->

## 系统程序

- `winver`  ------  检查Windows版本 

- `ver`  ------  显示 Windows 版本

- `mspaint  `------  画图板

- `calc`  ------  计算器

- `magnify`  ------  放大镜

- `mmc`  ------  打开控制台

- `notepad`  ------  新建记事本

- `tsshutdn`  ------  60秒倒计时关机命令 

- `rononce -p` ------15秒关机

- `taskmgr`  ------  任务管理器

- `explorer`  ------  打开资源管理器

- `ping`  ------  查看不同的网络是否通畅

  ```
  ping 主机ip或名字
  ```

- `netstat -ano`  ------  查看当前网络连接状态

- `cls`  ------  清除当前窗口内容

- `date`  ------  显示或设置日期

- `time`-- 显示或设置时间

- `start`  ------  新开一个命令窗口

- `ipconfig`  ------  查看本机 IP 配置

## 文件操作

> 关于文件路径（path）统一使用如下语法

```
[盘符:\] [路径\]
g:\test\folder\test.txt
```

- `C:`  ------  输入盘符，进入顶级目录

  ```
  // 进入D盘
  D: 
  ```

- `cd`  ------  进入目录命令

  进入目录时，输入文件夹首字母，按 Tab 键可自动填充和切换目录

  ```
  // 返回上一级目录
  cd ..
  // 进入test文件夹
  cd test
  ```

- `dir`  ------  显示当前目录下的文件及文件夹

- `copy path\fileName newPath\newFileName`  ------  复制文件

  path为空时，表示当前目录下的文件

- `move path\fileName newPath\newFileName`  ------  移动文件到newPath

- `del fileName`  ------  删除文件或清空文件夹

  del 后面是文件名时，将删除该文件，后面是文件夹名称时，将删除该文件夹下的所有子文件

- `mkdir folderName`  ------  创建文件夹

  ```
  // 完整命令： md [盘符:\] [路径\]
  md g:\test\newFolder
  ```

- `md`   ------  mkdir 的缩写

- `rmdir`  ------  删除文件夹

  只能删除空文件夹，如果要强制删除加上 ` /s` 就可以直接删除，删除过程会提示确定，添加 ` /q` 即安静模式（quiet）, 便可直接删除

  ```
  // 强制删除G盘下 test 文件夹下的 newFolder 文件夹
  rd /s /q g:\test\newFolder
  ```

- `rd`  ------  rmdir的缩写

- `rename oldName newName  ------  重命名文件或文件夹

- `ren`  ------  rename的缩写

- `type`  ------  显示文本文件的内容

- `type nul>fileName`  ------  创建空文件

- `echo [fileContent] > fileName`    ------  创建非空文件

