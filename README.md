
## 博客地址

<a href="https://mr-welson.github.io/" target="_blank">mr-welson.github.io</a>

这里是我记录学习笔记和演示一些小demo的地方，如果喜欢，Star 一个吧 *^_^* 



## hexo常用命令

启动服务器

```
// 预览 _post 文件夹
hexo server

// 预览 _post 和 _drafts 文件夹
hexo server --drafts
```

清除缓存文件 ( db.json ) 和已生成的静态文件 ( public )

```
hexo clean
```

新建文章

```
hexo new [layout] <title>
```

新建草稿

```
hexo new draft test
```

发布草稿

```
hexo publish test
```

生成静态文件

```
hexo generate
// 静态文件热更新
hexo generate --watch
```

部署 （发布）

```
hexo deploy

// 生成并部署 （以下均可）
hexo generate --deploy
hexo deploy --generate

// 简写
hexo g -d
hexo d -g
```

