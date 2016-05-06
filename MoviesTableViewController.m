//
//  MoviesTableViewController.m
//  Nuvies
//
//  Created by Riccardo Scanavacca on 04/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import "MoviesTableViewController.h"
#import "DetailViewController.h"
#import "NetworkController.h"

@interface MoviesTableViewController ()

@property (nonatomic, strong) NSArray *movieList;

@end

@implementation MoviesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.movieList = [NetworkController movieTitlesFeed];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.movieList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.movieList objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *movieTitle = [self.movieList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"MovieDetails" sender:movieTitle];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"MovieDetails"]) {
        
        NSString *selectedMovie = (NSString *) sender;
        DetailViewController *destinationViewController = (DetailViewController *) segue.destinationViewController;
        
        if (selectedMovie && destinationViewController) {
            destinationViewController.movieTitle = selectedMovie;
        } else {
            NSLog(@"Cannot perform segue");
        }
    }
    
    
}



//-(NSURLSession *) getURLSession {
//    static NSURLSession *session = nil;
//    static dispatch_once_t onceToken;
//    
//    dispatch_once( &onceToken, ^{
//        
//        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//        session = [NSURLSession sessionWithConfiguration:configuration];
//        
//    });
//    
//    return session;
//}











@end
