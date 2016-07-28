//
//  JHSspai.h
//  JHSspai
//
//  Created by 陈嘉豪 on 16/7/27.
//  Copyright © 2016年 陈嘉豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHSspaiPage.h"

@interface JHSspai : NSObject

@property NSUInteger numOfPages;
@property (nonatomic) BOOL error;

-(NSArray *)articlesWithURLString :(NSString *)URLString;
-(NSArray *)loadSwiperArticles;

@end
