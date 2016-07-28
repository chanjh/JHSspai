//
//  JHSspaiArticle.h
//  JHSspai
//
//  Created by 陈嘉豪 on 16/7/28.
//  Copyright © 2016年 陈嘉豪. All rights reserved.
//


#import <Foundation/Foundation.h>

@class JHSspaiPage, JHSspaiSwiper;

@interface JHSspaiArticle : NSObject

@property (nonatomic) NSString *tittle;
@property (nonatomic) NSString *imgLink;
@property (nonatomic) NSString *articleLink;
@property (nonatomic) BOOL error;

+(instancetype)articleAtSwiperWithIndex:(NSUInteger)index;
-(instancetype)initAtSwiperWithIndex:(NSUInteger)index;

+(instancetype)articleWithJHSspaiPage:(JHSspaiPage *)page atIndex:(NSUInteger)index;
+(instancetype)articleWithJHSspaiSwiper:(JHSspaiSwiper *)swiper atIndex:(NSUInteger)index;

-(instancetype)initWithJHSspaiPage:(JHSspaiPage *)page atIndex:(NSUInteger)index;
-(instancetype)initWithJHSspaiSwiper:(JHSspaiSwiper *)swiper atIndex:(NSUInteger)index;


+(instancetype)articleAtHomepageWithIndex:(NSUInteger)index;
+(instancetype)articleAtPage:(NSUInteger)pageIndex withIndex:(NSUInteger)index;
+(instancetype)articleWithTag:(NSString *)tag withIndex:(NSUInteger)index;
+(instancetype)articleWithTag:(NSString *)tag atPageIndex:(NSUInteger)pageIndex withIndex:(NSUInteger)index;


-(instancetype)initAtHomepageWithIndex:(NSUInteger)index;
-(instancetype)initAtPage:(NSUInteger)pageIndex withIndex:(NSUInteger)index;
-(instancetype)initWithTag:(NSString *)tag withIndex:(NSUInteger)index;
-(instancetype)initWithTag:(NSString *)tag atPageIndex:(NSUInteger)pageIndex withIndex:(NSUInteger)index;



/**
 * 注意：只有 JHPage 类调用它
 */
-(void)loadWithDictionary:(NSDictionary *)dic;


@end
