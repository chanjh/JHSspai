//
//  JHSspaiArticle.m
//  JHSspai
//
//  Created by 陈嘉豪 on 16/7/28.
//  Copyright © 2016年 陈嘉豪. All rights reserved.
//

#import "JHSspaiArticle.h"
#import "JHSspaiPage.h"
#import "JHSspaiSwiper.h"


@implementation JHSspaiArticle


+(instancetype)articleAtSwiperWithIndex:(NSUInteger)index{
    return [[[JHSspaiArticle alloc]init]initAtSwiperWithIndex:index];
}

-(instancetype)initAtSwiperWithIndex:(NSUInteger)index{
    JHSspaiSwiper *swiper = [[JHSspaiSwiper alloc]init];
    return [swiper articleAt:index];
}

+(instancetype)articleAtHomepageWithIndex:(NSUInteger)index{
    return [[[JHSspaiArticle alloc]init]initAtHomepageWithIndex:index];
}

+(instancetype)articleAtPage:(NSUInteger)pageIndex withIndex:(NSUInteger)index{
    return [[[JHSspaiArticle alloc]init]initAtPage:pageIndex withIndex:index];
}

+(instancetype)articleWithTag:(NSString *)tag withIndex:(NSUInteger)index{
    return [[[JHSspaiArticle alloc]init]initWithTag:tag withIndex:index];
}

+(instancetype)articleWithTag:(NSString *)tag atPageIndex:(NSUInteger)pageIndex withIndex:(NSUInteger)index{
    return [[[JHSspaiArticle alloc]init]initWithTag:tag atPageIndex:pageIndex withIndex:index];
}

+(instancetype)articleWithJHSspaiPage:(JHSspaiPage *)page atIndex:(NSUInteger)index{
    return [[[JHSspaiArticle alloc]init]initWithJHSspaiPage:page atIndex:index];
}

+(instancetype)articleWithJHSspaiSwiper:(JHSspaiSwiper *)swiper atIndex:(NSUInteger)index{
    return [[[JHSspaiArticle alloc]init]initWithJHSspaiSwiper:swiper atIndex:index];
    
}

-(instancetype)initAtHomepageWithIndex:(NSUInteger)index{
    JHSspaiPage *page = [JHSspaiPage pageAtHomepage];
    return [page articleAt:index];
}

-(instancetype)initAtPage:(NSUInteger)pageIndex withIndex:(NSUInteger)index{
    JHSspaiPage *page = [JHSspaiPage pageWithIndex:pageIndex];
    return [page articleAt:index];
}

-(instancetype)initWithTag:(NSString *)tag withIndex:(NSUInteger)index{
    JHSspaiPage *page = [JHSspaiPage pageWithTag:tag];
    return [page articleAt:index];
}

-(instancetype)initWithTag:(NSString *)tag atPageIndex:(NSUInteger)pageIndex withIndex:(NSUInteger)index{
    JHSspaiPage *page = [JHSspaiPage pageWithTag:tag atIndex:pageIndex];
    return [page articleAt:index];
}

-(instancetype)initWithJHSspaiPage:(JHSspaiPage *)page atIndex:(NSUInteger)index{
    return [page articleAt:index];
}
-(instancetype)initWithJHSspaiSwiper:(JHSspaiSwiper *)swiper atIndex:(NSUInteger)index{
    return [swiper articleAt:index];
}

-(void)loadWithDictionary:(NSDictionary *)dic{
    self.articleLink = [dic objectForKey:@"articleLink"];
    self.tittle = [dic objectForKey:@"tittle"];
    self.imgLink = [dic objectForKey:@"imgLink"];
}

-(BOOL)error{
    if(!_error)
        _error = NO;
    return _error;
}

@end
