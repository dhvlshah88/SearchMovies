//
//  MainTabBarController.m
//  SearchMovies
//
//  Created by Dhaval on 4/7/16.
//  Copyright © 2016 Dhaval. All rights reserved.
//

#import "MainTabBarController.h"
#import "MoviesSearchViewController.h"
#import "Masonry.h"

@interface MainTabBarController ()

@property (nonatomic, strong, readonly) UINavigationController *navigationViewController;
@property (nonatomic, strong, readonly) MoviesSearchViewController *moviesSearchViewController;

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
       
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
