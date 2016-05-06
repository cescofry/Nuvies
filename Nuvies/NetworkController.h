//
//  NetworkController.h
//  Nuvies
//
//  Created by ffrison on 06/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movies.h"

typedef void (^onComplete)(Movies * __nullable movie, NSString * __nullable errorMessage);

@interface NetworkController : NSObject

+ (NSURLSessionTask * _Nonnull)movieWithTitle:(NSString  * _Nonnull)movieTitle onCompletion:(nullable onComplete)completionHandler;

@end
