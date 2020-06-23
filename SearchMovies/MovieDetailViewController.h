//
//  SearchMovies
//
//  Created by Dhaval on 4/11/16.
//  Copyright © 2016 Dhaval. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Movie;

@interface MovieDetailViewController : UIViewController

@property (nonatomic, strong, readonly) Movie *movie;

- (instancetype)initWithMovie:(Movie *)movie;

@end
