//
//  SecondViewController.m
//  SearchMovies
//
//  Created by Dhaval on 4/7/16.
//  Copyright © 2016 Dhaval. All rights reserved.
//

#import "FavoriteMoviesViewController.h"

@interface FavoriteMoviesViewController ()

@end

@implementation FavoriteMoviesViewController

- (instancetype) init {
  self = [super init];
  if (self) {
    self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
  }
  
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.title = NSLocalizedString(@"Favorites", nil);
  
  _favoriteTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
  [self.view addSubview:self.favoriteTableView];
  self.favoriteTableView.dataSource = self;
  self.favoriteTableView.delegate = self;
  self.favoriteTableView.backgroundColor = [UIColor whiteColor];
  
  self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 0;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  return [[UITableViewCell alloc] init];
}


#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

@end
