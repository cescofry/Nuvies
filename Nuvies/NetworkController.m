//
//  NetworkController.m
//  Nuvies
//
//  Created by ffrison on 06/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import "NetworkController.h"
#import "Movies.h"
#import "MovieParser.h"

@implementation NetworkController



-(void)getMovieWithTitle:(NSString *)movieTitle onCompletion:(nullable onComplete)completionHandler
{
    
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
