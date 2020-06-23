//
//  SearchMovies
//
//  Created by Dhaval on 4/11/16.
//  Copyright © 2016 Dhaval. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "Movie.h"

@implementation MovieDetailViewController

- (instancetype)initWithMovie:(Movie *)movie {
    self = [super init];
    if (self) {
        _movie = movie;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = self.movie.movieName;
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
