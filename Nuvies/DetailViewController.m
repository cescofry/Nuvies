//
//  DetailViewController.m
//  Nuvies
//
//  Created by Riccardo Scanavacca on 04/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import "DetailViewController.h"
#import "Movies.h"
#import "NetworkController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    
    self.navigationController.title = self.movieTitle;

    [NetworkController movieWithTitle:self.movieTitle onCompletion:^(Movies * _Nullable movie, NSString * _Nullable errorMessage) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.movie = movie;
            [self loadDetailView];
        });
    }];
    
    
}



-(void)loadDetailView {
    

    self.country.text = self.movie.country;
    self.director.text = self.movie.director;
    self.actors.text = self.movie.actors;
    self.genre.text = self.movie.genre;
    
    self.metascore.text = self.movie.metascore;
    self.plot.text = self.movie.plot;
    
    [self viewWillAppear:YES];
    [self.presentedViewController setNeedsFocusUpdate];

    NSLog(@"load page called");
    
}





@end
