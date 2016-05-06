//
//  MovieParser.m
//  Nuvies
//
//  Created by ffrison on 06/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import "MovieParser.h"
#import "Movies.h"

@implementation MovieParser


+ (Movies *)movieFromDataDictionary:(NSDictionary * _Nonnull)dataDictionary
{
    NSLog(@"%@", dataDictionary.debugDescription);
    
    Movies *movie = [[Movies alloc] init];
    
    
    NSString *title = (NSString *) [dataDictionary valueForKey:@"Title"];
    if (title) {
        movie.title = title;
    }
    
    NSString *actors = (NSString *) [dataDictionary valueForKey:@"Actors"];
    if (actors) {
        movie.actors = actors;
    }
    
    NSString *country = (NSString *) [dataDictionary valueForKey:@"Country"];
    if (country) {
        movie.country = country;
    }
    
    NSString *director = (NSString *) [dataDictionary valueForKey:@"Director"];
    if (director) {
        movie.director = director;
    } else {
        movie.director = @"";
    }
    
    NSString *genre = (NSString *) [dataDictionary valueForKey:@"Genre"];
    if (genre) {
        movie.genre = genre;
    }
    
    NSString *plot = (NSString *) [dataDictionary valueForKey:@"Plot"];
    if (plot) {
        movie.plot = plot;
    }
    
    NSString *metascore = (NSString *) [dataDictionary valueForKey:@"Metascore"];
    if (metascore) {
        movie.metascore = metascore;
        
    }
    
    return movie;
}

@end
