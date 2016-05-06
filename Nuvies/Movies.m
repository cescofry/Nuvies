//
//  Movies.m
//  Nuvies
//
//  Created by Riccardo Scanavacca on 05/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import "Movies.h"

@implementation Movies


-(id)initWithMovieTitle:(NSString * _Nonnull)aMovie {
 
    
    if (self = [super init]) {
        [self getMovieWithTitle:aMovie onCompletion:^(NSDictionary * _Nullable dataDict, NSString * _Nullable errorMessage) {
            if (dataDict) {
                
                NSLog(@"%@", dataDict.debugDescription);
                
                NSString *title = (NSString *) [dataDict valueForKey:@"Title"];
                if (title) {
                    self.title = title;
                }
                
                NSString *actors = (NSString *) [dataDict valueForKey:@"Actors"];
                if (actors) {
                    self.actors = actors;
                }
                
                NSString *country = (NSString *) [dataDict valueForKey:@"Country"];
                if (country) {
                    self.country = country;
                }
                
                NSString *director = (NSString *) [dataDict valueForKey:@"Director"];
                if (director) {
                    self.director = director;
                } else {
                    self.director = @"";
                }
                
                NSString *genre = (NSString *) [dataDict valueForKey:@"Genre"];
                if (genre) {
                    self.genre = genre;
                }
                
                NSString *plot = (NSString *) [dataDict valueForKey:@"Plot"];
                if (plot) {
                    self.plot = plot;
                }
                
                NSString *metascore = (NSString *) [dataDict valueForKey:@"Metascore"];
                if (metascore) {
                    self.metascore = metascore;

                }
                
              
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter]postNotificationName:@"downloaded" object:nil];
                NSLog(@"notification posted");
            });
        }];
    }


    return self;
}


-(void)getMovieWithTitle:(NSString *)movieTitle onCompletion:(nullable onComplete)completionHandler{
    
    NSString *encodedMovieTitle = [self stringByAddingPercentEncodingForFormData:movieTitle];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat: @"http://www.omdbapi.com/?t=%@+&y=&plot=full&r=json",encodedMovieTitle]];
    NSLog(@"%@", url);

    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            NSError *err;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil) {
                completionHandler(json, nil);
            } else {
                completionHandler(nil, @"Data is Corrupt");
            }
        } else {
            completionHandler(nil, @"problem connecting with the server");
        }
        
    }] resume];
    
}

- (nullable NSString *)stringByAddingPercentEncodingForFormData: (nonnull NSString *)movieTitle {
    NSString *unreserved = @"*-._";
    NSMutableCharacterSet *allowed = [NSMutableCharacterSet alphanumericCharacterSet];
    [allowed addCharactersInString:unreserved];

    [allowed addCharactersInString:@" "];

    NSString *encoded = [movieTitle stringByAddingPercentEncodingWithAllowedCharacters:allowed];

    encoded = [encoded stringByReplacingOccurrencesOfString:@" "
                                                     withString:@"+"];
    return encoded;
}

@end
