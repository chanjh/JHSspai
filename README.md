# JHSspai - 少数派 Model 封装（iOS）


## Description

一个 Model 类，用来生成少数派站内数据。

## Third Lib

* [TFHpple](https://github.com/topfunky/hpple)

用来进行 HTML 的解析，关于这个库的使用方法查看 [USAGE](https://github.com/topfunky/hpple#usage)

## Usage

* 概念：Page、Swiper 与 Artcile 

    * Page：概念很好理解，每一个 Page 就是一个网页。生成一个 JHSspaiPage 对象就是获得一个页面内的文章信息。

    * Swiper: 少数派主页上有个自动滚动的栏，我定义了 JHSspaiSwiper 对象获取其中内容

    * Article：把每篇文章抽象成一个 JHSspaiArticle 对象，对象中有 tittle、imgLink、articleLink 三个实例。

```Objective-C

//Page

#import "JHSspaiPage.h"

// 生成主页的 JHSspaiPage 

JHSspaiPage *page = [JHSspaiPage pageAtHomepage];

// 生成 iOS 标签的 JHSspaiPage 

JHSspaiPage *page = [JHSspaiPage pageWithTag:@"iOS"];

// 生成搜索关键词 iOS 的 JHSspaiPage 

JHSspaiPage *page = [JHSspaiPage pageWithKeyWord:@"iOS"];

```

 ```Objective-C 

// Swiper

#import "JHSspaiSwiper.h" 

// 生成主页上的 swiper 

JHSspaiSwiper *swiper = [JHSspaiSwiper swiper];

``` 

```Objective-C

//Article

#import "JHSspaiArticle.h"

#import "JHSspaiPage.h"

#import "JHSspaiSwiper.h"

// 生成主页的第一篇文章的 JHSspaiArticle 对象

JHSSpaiArticle *article = [JHSspaiArticle articleAtPage:0 withIndex:0];

// 使用 Tag 获取文章，也支持选定页数

JHSspaiArticle *article= [JHSspaiArticle articleWithTag:@"iOS" atPageIndex:0 withIndex:0];

// 直接使用 JHSspaiPage 和 JHSspaiSwiper 对象生成 Article

JHSspaiArticle *article = [JHSspaiArticle articleWithJHSspaiPage:page atIndex:0];

```

* 常用数据

```
page.numOfArticles

page.numOfPages

page.error

article.tittle

article.imgLink

article.articleLink

```

## TODO

* 今日推荐

* Matrix 精选

* 最新评论

* 热门文章

* 少数派出品

* 编辑精选

## About

有什么建议或意见可以提交 issue 或者 email 给我

我的个人博客：[ChanTalk](https://chanjh.com)

知乎专栏：[ChanTalk](https://zhuanlan.zhihu.com/ChanTalk)