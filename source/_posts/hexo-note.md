---
title: Hexo 博客指南
categories:
  - 工具
tag:
  - Hexo 
  - NexT
  - 博客
date: 2018-11-20 18:42:14
---


# Hexo

## hexo简介

为了描述方便，在以下说明中，我们约定 ` 站点配置文件`  和  ` 主题配置文件`  两个不同配置文件的名称。

### 站点配置文件

根目录下的 `_config.yml`文件，主要包含 Hexo 本身的配置。

### 主题配置文件

主题（theme）目录下的 `_config.yml`文件，这份配置由主题作者提供，主要用于配置主题相关的选项。



<!-- more -->



### 常用命令

- 启动服务器，默认访问网址为： http://localhost:4000/

  ```
  // 预览 _post 文件夹
  hexo server
  
  // 预览 _post 和 _drafts 文件夹
  hexo server --drafts
  ```

- 清除缓存文件 ( db.json ) 和已生成的静态文件 ( public )

  ```
  // 在某些情况（尤其是更换主题后），如果发现您对站点的更改无论如何也不生效，您可能需要运行该命令。
  hexo clean
  ```

- 新建文章

  ```
  hexo new [layout] <title>
  ```

- 新建草稿

  ```
  hexo new draft test
  ```

- 发布草稿

  ```
  hexo publish test
  ```

- 生成静态文件

  ```
  hexo generate
  
  // 静态文件热更新
  // 监视文件变动并立即重新生成静态文件，在生成时会比对文件的 SHA1 checksum，只有变动的文件才会写入
  hexo generate --watch
  
  ```

- 部署 （发布）

  ```
  hexo deploy
  
  
  // 以下均可
  hexo generate --deploy
  hexo deploy --generate
  
  // 简写
  hexo g -d
  hexo d -g
  ```



## hexo安装
### **安装前提**
在安装前，您必须检查电脑中是否已安装下列应用程序：

- [Node.js](http://nodejs.org/)

- [Git](http://git-scm.com/)

如果您的电脑中已经安装上述必备程序，按照下述步骤即可新建一个项目，如果未安装，请先按照[官方指示](https://hexo.io/zh-cn/docs/#安装前提) 完成安装。

### **安装Hexo**

所有必备的应用程序安装完成后，即可使用 npm 安装 Hexo。

全局安装hexo脚手架（已安装过的请忽略这一步）

```
npm install -g hexo-cli
```

## 建站

### 创建项目

安装 Hexo 完成后，请执行下列命令，Hexo 将会在指定文件夹中新建所需要的文件。

```
创建一个hexo项目
	hexo init hexodemo
进入项目根目录
	cd hexodemo
安装依赖包
	npm install
```

新建完成后，指定文件夹的目录如下：

```
.
├── _config.yml
├── package.json
├── scaffolds
├── source
|   ├── _drafts
|   └── _posts
└── themes
```

### _config.yml

网站的 [配置](https://hexo.io/zh-cn/docs/configuration) 信息，您可以在此配置大部分的参数。

### scaffolds

[模版](https://hexo.io/zh-cn/docs/writing) 文件夹。当您新建文章时，Hexo 会根据 scaffold 来建立文件。

Hexo的模板是指在新建的markdown文件中默认填充的内容。

> 例如，如果您修改scaffold/post.md中的Front-matter内容，那么每次新建一篇文章时都会包含这个修改。

### source

资源文件夹是存放用户资源的地方。

除 `_posts` 文件夹之外，开头命名为 `_` (下划线)的文件 / 文件夹和隐藏的文件将会被忽略。

Markdown 和 HTML 文件会被解析并放到 `public` 文件夹，而其他文件会被拷贝过去。

### themes

[主题](https://hexo.io/zh-cn/docs/themes) 文件夹。Hexo 会根据主题来生成静态页面。

## 设置主题

> hexo 默认主题为 landscape，

### 下载主题

可以通过以下2种方式下载主题：

1. git 安装

- 好处：可以通过 `git pull` 快速更新主题

```
  进入项目根目录
  	cd hexodemo
  克隆安装包
  	git clone https://github.com/iissnan/hexo-theme-next themes/next
```

2. 压缩包安装

- 前往 NexT 版本 [发布页面](https://github.com/iissnan/hexo-theme-next/releases)。

- 选择你所需要的版本，下载 Download 区域下的 Source Code (zip) 到本地。

- 解压所下载的压缩包至站点的 themes 目录下， 并将 解压后的文件夹名称（`hexo-theme-next-0.4.0`）更改为 `next`。

### 启用主题

打开  ` 站点配置文件` ， 找到 `theme` 字段，并将其值更改为 `next`。

```
theme: next
```

### 主题配置

```
├── .github            #git信息
├── languages          #多语言
|   ├── default.yml    #默认语言
|   └── zh-Hans.yml    #简体中文
├── layout             #布局，根目录下的*.ejs文件是对主页，分页，存档等的控制
|   ├── _custom        #自定义模板
|   |   ├── _header.swig    #自定义网站页头，追加在页头模板之后
|   |   ├── _sidebar.swig   #自定义侧边栏
|   ├── _macro        #可以自己修改的模板，覆盖原有模板
|   ├── ├── post-collapse.swig    	#文章合并，在归档、分类、标签模板中引用
|   ├── ├── post-copyright.swig    	#文章版权协议模板
|   |   ├── post.swig    	#文章（正文和首页）模板
|   |   ├── reward.swig    	#打赏模板
|   |   ├── sidebar.swig   	#侧边栏模板
|	|	├── wechat-subscriber.swig   #微信公众号模板
|   ├── _partial       #局部的布局
|   |   ├── head       #<head>标签模板
|   |   |   ├── custom-head.swig    #追加在<head>标签末尾
|   |   |   ├── external-fonts.swig #外部字体模板
|   |   ├── search     #本地搜索模板
|   |   |   ├── xxxx.swig   #不同类型的搜索模板
|   |   ├── share      #分享模板
|   |   |   ├── xxxx.swig   #不同类型的分享模板
|   |   ├── comments.swig   #评论模板
|   |   ├── footer.swig   	#网站页脚模板
|   |   ├── head.swig  #<head>标签模板
|   |   ├── header.swig   #网站页头模板（导航栏等等模块）
|   |   ├── page-header.swig	#页面头部模板
|   |   ├── pagination.swig 	#分页器模板
|   |   ├── search.swig   	#搜索模板入口
|   ├── _scripts       #脚本语言文件夹
|   ├── _third-party   #第三方模板文件夹
|   |   ├── analytics  #统计分析相关的模板
|   |   ├── comments   #评论相关的模板
|   |   ├── search     #搜索相关的模板
|   |   ├── seo    	   #搜索引擎优化相关的模板
|   |   ├── xxx.swig   #其它，可根据文件名称辨认
|   ├── _layout.swig   #主页模板
|   ├── archive.swig   #归档页模板
|   ├── category.swig  #分类页模板
|   ├── index.swig     #post主体模板
|   ├── page.swig      #页面模板
|   └── tag.swig       #标签页模板
├── scripts            #script源码
|   ├── tags           #Hexo内置标签插件源码
|   ├── marge.js       #页面模板
├── source             #资源源码
|   ├── css            #css源码
|   |   ├── _common    #*.styl基础css
|   |   ├── _custom    #*.styl局部css
|   |   └── _mixins    #mixins的css
|   ├── fonts          #字体
|   ├── images         #图片
|   └── js             #javascript源代码
├── _config.yml        #主题配置文件
└── README.md          
```



## 配置相关

### 阅读全文

**1.** 【推荐】在文章中适当位置插入 ` <!--more-->` 手动截断，该位置之前的部分即为摘要，会显示在首页中；

**2. ** 在文章的 `front-matter` 中添加 `description`，并提供文章摘录；

**3.**  自动形成摘要，在 `主题配置文件` 中添加，根据设置的 length 截断作为摘要。

```
auto_excerpt:
  enable: true
  length: 150
```

### 本地搜索

**1.**  安装 `hexo-generator-searchdb`

```
npm install hexo-generator-searchdb --save
```

**2.**  编辑  ` 站点配置文件`  文件，新增以下内容到任意位置：

```
search:
  path: search.xml
  field: post
  format: html
  limit: 10000
```

**3.**  编辑  ` 主题配置文件` ，启用本地搜索功能：

```
# Local search
local_search:
  enable: true
```







