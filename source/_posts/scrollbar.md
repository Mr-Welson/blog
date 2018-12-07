---
title: 滚动条美化
categories:
  - HTML/CSS
tag:
  - css
---



   	浏览器默认的滚动条样式非常感人，追求完美的产品当然不会放过这一细节，以下便给出通过CSS修改滚动条样式的代码。

<!-- more -->

[demo演示](https://mr-welson.github.io/demo/scrollbar/)

 **谷歌浏览器：** 

```css
/* 修改滚动条颜色和宽度 必须的样式 */
::-webkit-scrollbar {
    width: 10px;  /* 纵向滚动条宽度 */
    height: 10px; /* 横向滚动条高度 */
    border: 2px solid purple;
    border-radius: 5px;
    background-color: cadetblue;
}

/* 滑块样式 */
::-webkit-scrollbar-thumb {
    border: 2px solid #000;
    border-radius: 5px;
    background: #fff;
}

/* 滚动条外层轨道样式，相同属性的样式会被内层轨道样式遮盖 */
::-webkit-scrollbar-track {
   border: 2px solid gold; 
　　background-color: rgb(25, 214, 25)
}

/* 滚动条内层轨道样式 */
::-webkit-scrollbar-track-piece {
    border-radius: 5px;
    border: 2px solid #fff;
    background-color: #000;
}

/* 滚动条两端的按钮样式 */
::-webkit-scrollbar-button {
    width: 50px;  
    height: 50px; 
    border: 2px solid red;
    border-radius: 5px;
    background: gold;
}
/* 横向滚动条和纵向滚动条交汇处样式 */
::-webkit-scrollbar-corner {
    background-color: red;
    border: 2px solid green;
    border-radius: 5px;
}
```

**IE浏览器** 也可作出部分修改：

```css
.scroll {
	/* 设置滚动条主要构成部分的颜色 */
    scrollbar-base-color: red;
    /* 滑块颜色 */
    scrollbar-face-color: #000;
    /* 滑块边框 */
    scrollbar-shadow-color: red;
    /* 设置滚动条两端箭头的颜色 */
    scrollbar-arrow-color: red;
    /* 滚动条轨道颜色 */
    scrollbar-track-color:green;
    /* 设置滚动框的和滚动条箭头左上边缘的颜色 不生效 */
    scrollbar-highlight-color:blue;
    /* 设置滚动框的和滚动条箭头左上边缘的颜色 不生效 */
    scrollbar-3dlight-color:blue; 
    /* 设置滚动条槽的颜色 不生效 */
    scrollbar-darkshadow-color:blue;    
}

```