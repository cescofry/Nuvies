//
//  MovieFeedParser.m
//  Nuvies
//
//  Created by ffrison on 06/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import "MovieFeedParser.h"

@interface MovieFeedParser ()

@property (nonatomic, strong,readwrite) NSMutableArray *movieList;
@property (nonatomic, strong) NSString *element;
@property (nonatomic, strong) NSString *filmTitle;

@property (nonatomic, strong) NSURL *url;

@end

@implementation MovieFeedParser


- (instancetype)initWithURL:(NSURL * _Nonnull)url
{
    self = [super init];
    if (self) {
        self.movieList = [NSMutableArray array];
        self.url = url;
    }
    return self;
}

- (void)parse
{
    NSXMLParser *parser = [[NSXMLParser alloc]initWithContentsOfURL:self.url];
    parser.delegate = self;
    [parser parse];
}

#pragma mark - Parse RSS data


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    self.element = elementName;
    
    if ([self.element isEqualToString:@"title"]) {
        self.filmTitle = [NSMutableString string];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([self.element isEqualToString:@"title"]) {
        if(![self.filmTitle isEqualToString:@"New Movies"]) {
            [self.movieList addObject:self.filmTitle];
        }
    }
    
    self.filmTitle = nil;
    self.element = nil;
    
}

-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if (!self.element) return;
    
    if ([self.element isEqualToString:@"title"]) {
        self.filmTitle = string;
        
    }
}



@end
