//
//  SearchMovies
//
//  Created by Dhaval on 4/7/16.
//  Copyright © 2016 Dhaval. All rights reserved.
//

@import UIKit;
#import "MoviesDataDownloadManagerDelegate.h"

@interface MoviesSearchViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchBarDelegate, MoviesDataDownloadManagerDelegate>

@property (nonatomic, strong, readonly) UITableView *resultTableView;

@end

