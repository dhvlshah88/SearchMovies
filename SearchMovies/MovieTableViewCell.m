//
//  MoviesTableViewCell.m
//  SearchMovies
//
//  Created by Dhaval on 4/8/16.
//  Copyright © 2016 Dhaval. All rights reserved.
//

#import "MovieTableViewCell.h"
#import "Movie.h"

CGFloat kMoviePosterImageViewHeight = 30.0;

@interface MovieTableViewCell ()

@property (nonatomic, strong, readonly) UIButton *favoriteMovieButton;

@end


@implementation MovieTableViewCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    
    if (self) {
        _moviePosterView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.moviePosterView];
        self.moviePosterView.contentMode = UIViewContentModeScaleToFill;
        
        [self.moviePosterView makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).with.offset(10);
            make.width.and.height.equalTo(@(kMoviePosterImageViewHeight));
        }];
        
        _movieName = [[UILabel alloc] init];
        [self.contentView addSubview:self.movieName];
        self.movieName.font = [UIFont boldSystemFontOfSize:15.0];
        self.movieName.textColor = [UIColor whiteColor];
        self.movieName.numberOfLines = 0;
        self.movieName.lineBreakMode = NSLineBreakByWordWrapping;
        self.movieName.preferredMaxLayoutWidth = self.frame.size.width - kMoviePosterImageViewHeight - (2 * 10);
        
        [self.movieName makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.top).with.offset(10);
            make.leading.equalTo(self.moviePosterView.trailing).with.offset(10);
            make.trailing.equalTo(self.contentView).with.offset(-10);
            make.height.lessThanOrEqualTo(self.contentView).dividedBy(2);
        }];
        
        _directorName = [[UILabel alloc] init];
        [self.contentView addSubview:self.directorName];
        self.directorName.font = [UIFont systemFontOfSize:13.0];
        self.directorName.textColor = [UIColor whiteColor];
        
        [self.directorName makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.movieName.bottom).with.offset(5);
            make.leading.equalTo(self.movieName);
            make.trailing.equalTo(self.movieName);
        }];
        
        _movieIntro = [[UILabel alloc] init];
        [self.contentView addSubview:self.movieIntro];
        self.movieIntro.font = [UIFont systemFontOfSize:11.0];
        self.movieIntro.textColor = [UIColor whiteColor];
        self.movieName.numberOfLines = 0;
        self.movieName.lineBreakMode = NSLineBreakByWordWrapping;
        
        [self.movieIntro makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.directorName.bottom).with.offset(5);
            make.leading.equalTo(self.movieName);
            make.trailing.equalTo(self.movieName);
            make.bottom.equalTo(self.contentView.bottom).with.offset(-10);
        }];
        
        _favoriteMovieButton = [[UIButton alloc] init];
        
        self.backgroundColor = [[UIColor brownColor] colorWithAlphaComponent:0.8];
    }
    
    return self;
}
//
//- (CGSize)intrinsicContentSize {
//    return CGSizeMake(UIViewNoIntrinsicMetric, (self.movieName.frame.size.height + self.directorName.frame.size.height + self.movieIntro.frame.size.height + (3 * 10)));
//}

@end
