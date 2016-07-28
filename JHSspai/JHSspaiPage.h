//
//  JHSspaiPage.h
//  JHSspai
//
//  Created by 陈嘉豪 on 16/7/27.
//  Copyright © 2016年 陈嘉豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHSspaiArticle.h"

@interface JHSspaiPage : NSObject

@property NSUInteger numOfPages;
@property NSUInteger numOfArticles;
@property BOOL error;

-(NSArray *)allImgLinks;
-(NSArray *)allTittles;
-(NSArray *)allArticleLinks;

/**
 * 返回一个 JHSspaiArticle 对象，包含标题链接图片链接
 */
-(JHSspaiArticle *)articleAt:(NSUInteger)index;

#pragma mark -

/**
 * 返回主页的 JHSspaiPage 对象，包含页面内所有标题等信息。使用 JHSspaiArticle 对象可以调用这些量
 */
+(instancetype)pageAtHomepage;
+(instancetype)pageWithIndex:(NSUInteger)index;
+(instancetype)pageWithTag:(NSString *)tag;
+(instancetype)pageWithTag:(NSString *)tag atIndex:(NSUInteger)index;

// 搜索相关
+(instancetype)pageWithKeyWord:(NSString *)keyWord;
+(instancetype)pageWithKeyWordByArticleTittle:(NSString *)keyWord;
+(instancetype)pageWithKeyWordByArticleWriter:(NSString *)keyWord;
+(instancetype)pageWithKeyWord:(NSString *)keyWord atIndex:(NSUInteger)index;
+(instancetype)pageWithKeyWordByArticleTittle:(NSString *)keyWord atIndex:(NSUInteger)index;
+(instancetype)pageWithKeyWordByArticleWriter:(NSString *)keyWord atIndex:(NSUInteger)index;


-(instancetype)initAtHomepage;
-(instancetype)initWithIndex:(NSUInteger)index;
-(instancetype)initWithTag:(NSString *)tag;
-(instancetype)initWithTag:(NSString *)tag atIndex:(NSUInteger)index;

//搜索相关
-(instancetype)initWithKeyWord:(NSString *)keyWord;
-(instancetype)initWithKeyWordByArticleTittle:(NSString *)keyWord;
-(instancetype)initWithKeyWordByArticleWriter:(NSString *)keyWord;
-(instancetype)initWithKeyWord:(NSString *)keyWord atIndex:(NSUInteger)index;
-(instancetype)initWithKeyWordByArticleTittle:(NSString *)keyWord atIndex:(NSUInteger)index;
-(instancetype)initWithKeyWordByArticleWriter:(NSString *)keyWord atIndex:(NSUInteger)index;


@end
