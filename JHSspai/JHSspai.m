//
//  JHSspai.m
//  JHSspai
//
//  Created by 陈嘉豪 on 16/7/27.
//  Copyright © 2016年 陈嘉豪. All rights reserved.
//

#import "JHSspai.h"
#import "TFHpple.h"
#import "TFHppleElement.h"

@interface JHSspai ()

@property (nonatomic) NSMutableArray *articlesDicArray;

@end

@implementation JHSspai

#pragma mark

//返回 NSArray
-(NSArray *)articlesWithURLString :(NSString *)URLString{
    [self loadArticleDicArrayWithURLString:URLString];
    return self.articlesDicArray;
}

-(NSArray *)loadSwiperArticles{
    NSString *URLString = @"http://sspai.com/";
    NSURL *URL = [NSURL URLWithString:URLString];
    NSData *htmlData = [NSData dataWithContentsOfURL:URL];
    TFHpple *doc = [[TFHpple alloc]initWithHTMLData:htmlData];
    NSArray *itemsArray = [doc searchWithXPathQuery:@"//div[@class = 'swiper-slide']"];
    NSArray *imgLinkArray = [doc searchWithXPathQuery:@"//div[@class = 'banner banner1']"];
    
    //错误提醒
    if(!itemsArray.count){
        self.error = YES;
        NSLog(@"文章数量为空");
    }
    
    for ( TFHppleElement *element in imgLinkArray){
        NSArray * arr = [element children];
        TFHppleElement *href = [arr objectAtIndex:3];
        NSString *imgLink = [href objectForKey:@"src"];
        NSString *tittle = [href objectForKey:@"alt"];
        //制作字典
        NSArray *keysArray = @[@"imgLink", @"tittle"];
        NSArray *objsArray = @[imgLink, tittle];
        NSDictionary *dic = [[NSDictionary alloc]initWithObjects:objsArray forKeys:keysArray];
        NSMutableDictionary *Mdic = [[NSMutableDictionary alloc]initWithDictionary:dic];
        
        [self.articlesDicArray addObject:Mdic];
        
    }
    int i = 0;
    for ( TFHppleElement *element in itemsArray){
        NSArray * arr = [element children];
        TFHppleElement *href = [arr objectAtIndex:1];
        NSString *articleLink = [href objectForKey:@"href"];
        [self.articlesDicArray[i] setObject:articleLink forKey:@"articleLink"];
        i++;
    }
    return self.articlesDicArray;
}



-(void)loadArticleDicArrayWithURLString:(NSString *)URLString{
    NSString *URLStrUTF8 = [URLString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *URL = [NSURL URLWithString:URLStrUTF8];
    NSData *htmlData = [NSData dataWithContentsOfURL:URL];
    TFHpple *doc = [[TFHpple alloc]initWithHTMLData:htmlData];
    NSArray *itemsArray = [doc searchWithXPathQuery:@"//div[@class = 'banner']"];
    
    //错误提醒
    if(!itemsArray.count){
        self.error = YES;
        NSLog(@"文章数量为空");
    }
    
    [self loadArticleInfo:itemsArray];
    [self loadNumOfPages:doc];

}

//获取本条件下总页数
-(void)loadNumOfPages:(TFHpple *)doc{
    NSArray *pageArray = [doc searchWithXPathQuery:@"//span[@class = 'page-count']"];
    if(!pageArray.count)
        self.numOfPages = 1;
    else
        for ( TFHppleElement *element in pageArray){
            NSString *string = [NSString stringWithFormat:@"%@",[element content]];
            NSString *numOfPages = [[[string componentsSeparatedByString:@"/"]lastObject]componentsSeparatedByString:@"页"][0];
            self.numOfPages = [numOfPages integerValue];
        }
}

//获取文章标题、链接、图片链接等
-(void)loadArticleInfo:(NSArray *)itemsArray{
    for ( TFHppleElement *element in itemsArray){
        NSArray * arr = [element children];
        
        //获取文章链接
        TFHppleElement *href = [arr objectAtIndex:1];;
        NSString * articleLink = [href objectForKey:@"href"];
        //获取文章图片
        NSArray *array = [href children];
        TFHppleElement *scr = [array objectAtIndex:3];
        NSString *imgLink = [scr objectForKey:@"src"];
        //获取文章标题
        NSString *tittle = [scr objectForKey:@"alt"];
        //NSLog(@"%@",tittle);
        
        //制作字典
        NSArray *keysArray = @[@"articleLink", @"imgLink", @"tittle"];
        NSArray *objsArray = @[articleLink, imgLink, tittle];
        NSDictionary *dic = [[NSDictionary alloc]initWithObjects:objsArray forKeys:keysArray];
        [self.articlesDicArray addObject:dic];
    }
}


#pragma mark
-(BOOL)error{
    if(!_error)
        _error = NO;
    return _error;
}

-(NSMutableArray *)articlesDicArray{
    if(!_articlesDicArray)
        _articlesDicArray = [[NSMutableArray alloc]init];
    return _articlesDicArray;
}

@end

