//
//  JHSspaiPage.m
//  JHSspai
//
//  Created by 陈嘉豪 on 16/7/27.
//  Copyright © 2016年 陈嘉豪. All rights reserved.
//

#import "JHSspaiPage.h"
#import "JHSspai.h"


@interface JHSspaiPage ()

@property (nonatomic) NSMutableArray *articlesDicArray;
@property (strong) NSMutableArray *allImgLinks;
@property (strong) NSMutableArray *allTittles;
@property (strong) NSMutableArray *allArticleLinks;


@end

@implementation JHSspaiPage

#pragma mark - 初始化

+(instancetype)pageAtHomepage{
    JHSspaiPage *page = [[JHSspaiPage alloc]init];
    return [page initAtHomepage];
}
+(instancetype)pageWithTag:(NSString *)tag atIndex:(NSUInteger)index{
    JHSspaiPage *page = [[JHSspaiPage alloc]init];
    return [page initWithTag:tag atIndex:index];
}

+(instancetype)pageWithIndex:(NSUInteger)index{
    JHSspaiPage *page = [[JHSspaiPage alloc]init];
    return [page initWithIndex:index];
}

+(instancetype)pageWithTag:(NSString *)tag{
    JHSspaiPage *page = [[JHSspaiPage alloc]init];
    return [page initWithTag:tag];
}

// Search
+(instancetype)pageWithKeyWord:(NSString *)keyWord{
    JHSspaiPage *page = [[JHSspaiPage alloc]init];
    return [page initWithKeyWord:keyWord];
}
+(instancetype)pageWithKeyWordByArticleTittle:(NSString *)keyWord{
    JHSspaiPage *page = [[JHSspaiPage alloc]init];
    return [page initWithKeyWord:keyWord];
}
+(instancetype)pageWithKeyWordByArticleWriter:(NSString *)keyWord{
    JHSspaiPage *page = [[JHSspaiPage alloc]init];
    return [page initWithKeyWordByArticleWriter:keyWord];
}
+(instancetype)pageWithKeyWord:(NSString *)keyWord atIndex:(NSUInteger)index{
    JHSspaiPage *page = [[JHSspaiPage alloc]init];
    return [page initWithKeyWord:keyWord atIndex:index];
}
+(instancetype)pageWithKeyWordByArticleTittle:(NSString *)keyWord atIndex:(NSUInteger)index{
    
    JHSspaiPage *page = [[JHSspaiPage alloc]init];
    return [page initWithKeyWordByArticleTittle:keyWord atIndex:index];
}
+(instancetype)pageWithKeyWordByArticleWriter:(NSString *)keyWord atIndex:(NSUInteger)index{
    JHSspaiPage *page = [[JHSspaiPage alloc]init];
    return [page initWithKeyWordByArticleWriter:keyWord atIndex:index];
}


#pragma mark 

// Search
-(instancetype)initWithKeyWord:(NSString *)keyWord{
    self = [super init];
    NSString *URLString = [NSString stringWithFormat:@"http://sspai.com/search/?q=%@",keyWord];
    [self loadArticlesWithURLString:URLString];
    return self;
}
-(instancetype)initWithKeyWordByArticleTittle:(NSString *)keyWord{
    return [self initWithKeyWord:keyWord];
}
-(instancetype)initWithKeyWordByArticleWriter:(NSString *)keyWord{
    self = [super init];
    NSString *URLString = [NSString stringWithFormat:@"http://sspai.com/search/?q=%@&type=user",keyWord];
    [self loadArticlesWithURLString:URLString];
    return self;
}
-(instancetype)initWithKeyWord:(NSString *)keyWord atIndex:(NSUInteger)index{
    self = [super init];
    NSString *URLString = [NSString stringWithFormat:@"http://sspai.com/search/?q=%@&page=%lu",keyWord, (unsigned long)index];
    [self loadArticlesWithURLString:URLString];
    return self;
}
-(instancetype)initWithKeyWordByArticleTittle:(NSString *)keyWord atIndex:(NSUInteger)index{
    return [self initWithKeyWord:keyWord atIndex:index];
}
-(instancetype)initWithKeyWordByArticleWriter:(NSString *)keyWord atIndex:(NSUInteger)index{
    self = [super init];
    NSString *URLString = [NSString stringWithFormat:@"http://sspai.com/search/?q=%@&type=use&page=%lu",keyWord, (unsigned long)index];
    [self loadArticlesWithURLString:URLString];
    return self;
}


-(instancetype)initAtHomepage{
    self = [super init];
    NSUInteger index = 0;
    return [self initWithIndex:index];
}

-(instancetype)initWithTag:(NSString *)tag atIndex:(NSUInteger)index{
    self = [super init];
    index += 1;
    NSString *URLString = [NSString stringWithFormat:@"http://sspai.com/tag/%@/?page=%lu", tag, (unsigned long)index];
    [self loadArticlesWithURLString:URLString];
    return self;
}

-(instancetype)initWithTag:(NSString *)tag{
    self = [super init];
    NSString *URLString = [NSString stringWithFormat:@"http://sspai.com/tag/%@",tag];
    [self loadArticlesWithURLString:URLString];
    return self;
}
-(instancetype)initWithIndex:(NSUInteger)index{
    self = [super init];
    index += 1;
    NSString *URLString = [NSString stringWithFormat:@"http://sspai.com/?page=%lu",(unsigned long)index];
    [self loadArticlesWithURLString:URLString];
    return self;
}

-(instancetype)init{
    self = [super init];
    _allImgLinks = [NSMutableArray array];
    _allTittles = [NSMutableArray array];
    _allArticleLinks = [NSMutableArray array];
    self.numOfArticles = 0;
    return self;
}


#pragma mark -
/**
 * 生成 JHSspaiArticle 对象
 */
-(JHSspaiArticle *)articleAt:(NSUInteger)index{
    JHSspaiArticle *article = [[JHSspaiArticle alloc]init];
    if(!self.error){
        NSDictionary *articleDic = [[NSDictionary alloc]initWithDictionary:[_articlesDicArray objectAtIndex:index]];
        [article loadWithDictionary:articleDic];
    }
    return article;
}

-(void)loadArticlesWithURLString:(NSString *)URLString{
    JHSspai *sspai = [[JHSspai alloc]init];
    NSArray *articlesDicArray = [sspai articlesWithURLString:URLString];
    [self.articlesDicArray addObjectsFromArray:articlesDicArray];
    NSDictionary  *dic;
    for (dic in self.articlesDicArray){
        NSString *tittle = [[dic objectForKey:@"tittle"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [_allTittles addObject:tittle];
        [_allImgLinks addObject:[dic objectForKey:@"imgLink"]];
        [_allArticleLinks addObject:[dic objectForKey:@"articleLink"]];
        self.numOfArticles++;
    }
    self.numOfPages = sspai.numOfPages;
    self.error = sspai.error;    
}

/** 懒加载 */
-(NSMutableArray *)articlesDicArray{
    if(!_articlesDicArray)
        _articlesDicArray = [[NSMutableArray alloc]init];
    return _articlesDicArray;
}


@end
