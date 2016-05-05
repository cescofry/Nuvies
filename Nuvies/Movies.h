//
//  Movies.h
//  Nuvies
//
//  Created by Riccardo Scanavacca on 05/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete)(NSDictionary * __nullable dataDict, NSString * __nullable errorMessage);

@interface Movies : NSObject

@property (nonatomic, strong) NSString * _Nonnull title;
@property (nonatomic, strong) NSString * _Nonnull actors;
@property (nonatomic, strong) NSString * _Nonnull country;
@property (nonatomic, strong) NSString * _Nonnull director;
@property (nonatomic, strong) NSString * _Nonnull genre;
@property (nonatomic, strong) NSString * _Nonnull plot;
@property (nonatomic, strong) NSString * _Nonnull metascore;

-(id _Nonnull)initWithMovieTitle:(NSString * _Nonnull)aMovie;

@end
