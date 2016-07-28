//
//  JHSspaiSwiper.h
//  JHSspai
//
//  Created by 陈嘉豪 on 16/7/28.
//  Copyright © 2016年 陈嘉豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHSspaiArticle.h"

@interface JHSspaiSwiper : NSObject

@property (nonatomic) NSUInteger numOfItems;
@property (nonatomic) BOOL error;


+(instancetype)swiper;
-(JHSspaiArticle *)articleAt:(NSUInteger)index;

-(NSArray *)allImgLinks;
-(NSArray *)allTittles;
-(NSArray *)allArticleLinks;

@end
