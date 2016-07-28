//
//  JHSspaiSwiper.m
//  JHSspai
//
//  Created by 陈嘉豪 on 16/7/28.
//  Copyright © 2016年 陈嘉豪. All rights reserved.
//

#import "JHSspaiSwiper.h"
#import "JHSspai.h"

@interface JHSspaiSwiper()


@property (nonatomic) NSMutableArray *allImgLinks;
@property (nonatomic) NSMutableArray *allTittles;
@property (nonatomic) NSMutableArray *allArticleLinks;
@property (nonatomic) NSMutableArray *articlesDicArray;


@end

@implementation JHSspaiSwiper

+(instancetype)swiper{
    JHSspaiSwiper *swiper = [[JHSspaiSwiper alloc]init];
    return swiper;
}


-(instancetype)init{
    self = [super init];
    _allImgLinks = [NSMutableArray array];
    _allTittles = [NSMutableArray array];
    _allArticleLinks = [NSMutableArray array];
    self.numOfItems = 0;
    [self loadArticleDicArray];
    return self;
}

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


-(NSMutableArray *)articlesDicArray{
    if(!_articlesDicArray)
        _articlesDicArray = [[NSMutableArray alloc]init];
    return _articlesDicArray;
}

-(void)loadArticleDicArray{
    JHSspai *sspai = [[JHSspai alloc]init];
    NSArray *articlesDicArray = [sspai loadSwiperArticles];
    [self.articlesDicArray addObjectsFromArray:articlesDicArray];
    NSDictionary  *dic;
    for (dic in self.articlesDicArray){
        NSString *tittle = [[dic objectForKey:@"tittle"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [_allTittles addObject:tittle];
        [_allImgLinks addObject:[dic objectForKey:@"imgLink"]];
        [_allArticleLinks addObject:[dic objectForKey:@"articleLink"]];
        self.numOfItems++ ;
    }
    self.error = sspai.error;
}



@end
