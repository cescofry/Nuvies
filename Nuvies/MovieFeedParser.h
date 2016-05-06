//
//  MovieFeedParser.h
//  Nuvies
//
//  Created by ffrison on 06/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieFeedParser : NSObject <NSXMLParserDelegate>

@property (nonatomic, strong, readonly) NSMutableArray *movieList;

- (instancetype)initWithURL:(NSURL * _Nonnull)url;
- (void)parse;

@end
