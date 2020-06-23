//
//  SearchMovies
//
//  Created by Dhaval on 4/8/16.
//  Copyright © 2016 Dhaval. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Movie;

@interface MovieTableViewCell : UITableViewCell

@property (nonatomic, strong, readonly) UIImageView *moviePosterView;
@property (nonatomic, strong, readonly) UILabel *movieName;
@property (nonatomic, strong, readonly) UILabel *directorName;
@property (nonatomic, strong, readonly) UILabel *movieIntro;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;

@end
