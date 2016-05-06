//
//  MovieParser.h
//  Nuvies
//
//  Created by ffrison on 06/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Movies;
@interface MovieParser : NSObject

+ (Movies *)movieFromDataDictionary:(NSDictionary * _Nonnull)dataDictionary;

@end
