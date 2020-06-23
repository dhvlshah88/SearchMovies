//
//  FirstViewController.m
//  SearchMovies
//
//  Created by Dhaval on 4/7/16.
//  Copyright © 2016 Dhaval. All rights reserved.
//

#import "MoviesSearchViewController.h"
#import "MoviesDataDownloadManager.h"
#import "MovieTableViewCell.h"
#import "MovieDataUtil.h"
#import "Movie.h"
#import "MovieDetailViewController.h"

static NSString * const kMoviesTableViewCellIdentifier = @"kMoviesTableViewCellIdentifier";

@interface MoviesSearchViewController ()

@property (nonatomic, strong, readonly) UISearchController *searchController;
@property (nonatomic, strong) NSArray *searchResults;
@property (nonatomic, strong) MoviesDataDownloadManager *downloadManager;
@property (nonatomic, strong) NSCache *movieImageCache;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) MovieDetailViewController *movieDetailViewController;

@end

@implementation MoviesSearchViewController

- (instancetype)init {
  self = [super init];
  if (self) {
    self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:0];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  _searchResults = nil;
  _downloadManager = [[MoviesDataDownloadManager alloc] init];
  self.downloadManager.downloadDelegate = self;
  
  self.navigationController.navigationBar.barTintColor = [UIColor brownColor];
  self.title = NSLocalizedString(@"Movies", nil);
  self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
  
  _resultTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
  self.resultTableView.dataSource = self;
  self.resultTableView.delegate = self;
  [self.view addSubview:self.resultTableView];
  self.resultTableView.backgroundColor = [UIColor whiteColor];
  self.resultTableView.rowHeight = UITableViewAutomaticDimension;
  self.resultTableView.estimatedRowHeight = 100;
  
  [self.resultTableView makeConstraints:^(MASConstraintMaker *make) {
    make.top.and.left.equalTo(self.view);
    make.width.equalTo(self.view);
    make.bottom.equalTo(self.view);
  }];
  
  _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
  self.searchController.searchBar.placeholder = NSLocalizedString(@"Search Movies", nil);
  self.searchController.searchBar.delegate = self;
  self.searchController.searchResultsUpdater = self;
  [self.navigationItem setSearchController: self.searchController];
  self.searchController.searchBar.tintColor = [UIColor brownColor];
  self.searchController.searchBar.translucent = true;
  [self.searchController.searchBar sizeToFit];
  self.searchController.obscuresBackgroundDuringPresentation = false;
  self.searchController.hidesNavigationBarDuringPresentation = false;
  
  self.definesPresentationContext = true;
  self.view.backgroundColor = [UIColor clearColor];
  
  _movieImageCache = [[NSCache alloc] init];
  _dateFormatter = [[NSDateFormatter alloc] init];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  MovieTableViewCell *cell = (MovieTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kMoviesTableViewCellIdentifier];
  
  if (!cell) {
    cell = [[MovieTableViewCell alloc] initWithReuseIdentifier:kMoviesTableViewCellIdentifier];
    
    cell.selectedBackgroundView = [[UIView alloc] init];
    cell.selectedBackgroundView.backgroundColor = [UIColor brownColor];
  }
  
  Movie *movie = [self.searchResults objectAtIndex:indexPath.row];
  NSDate *releaseDate = [MovieDataUtil releaseDateForRFC3339String:movie.releaseYear usingFormatter:self.dateFormatter];
  cell.movieName.text = [NSString stringWithFormat:@"%@ (%@)", movie.movieName, [MovieDataUtil releaseYearFromDate:releaseDate usingFormatter:self.dateFormatter]];
  cell.directorName.text = movie.directorName;
  cell.movieIntro.text = movie.movieIntro;
  cell.moviePosterView.image = nil;
  
  if ([self.movieImageCache objectForKey:movie.movieId]) {
    cell.moviePosterView.image = [self.movieImageCache objectForKey:movie.movieId];
  } else {
    NSURL *imageUrl = [[NSURL alloc] initWithString:movie.moviePosterUrl];
    [[self.downloadManager.urlSession dataTaskWithURL:imageUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      if (!error) {
        UIImage *movieImage = [UIImage imageWithData:data];
        [self.movieImageCache setObject:movieImage forKey:movie.movieId];
        dispatch_async(dispatch_get_main_queue(), ^{
          cell.moviePosterView.image = movieImage;
        });
      }
    }] resume];
  }
  
  return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:true];
  Movie *selectedMovie = [self.searchResults objectAtIndex:indexPath.row];
  
  _movieDetailViewController = [[MovieDetailViewController alloc] initWithMovie:selectedMovie];
  [self.navigationController pushViewController:self.movieDetailViewController animated:true];
}

#pragma mark UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
  NSString *searchTerm = [searchController.searchBar.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
  [self.downloadManager downloadJSONForSearchTerm:searchTerm];
}

#pragma mark UISearchBarDelegate

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
  
}

#pragma mark MoviesDataDownloadManagerDelegate

- (void)downloadSearchResultDictionary:(NSDictionary *)searchedResultDictionary {
  _searchResults = [MovieDataUtil moviesFromJSONData:searchedResultDictionary];
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.resultTableView reloadData];
  });
}

@end
