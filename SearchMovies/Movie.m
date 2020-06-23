//
//  Movie.m
//  SearchMovies
//
//  Created by Dhaval on 4/7/16.
//  Copyright © 2016 Dhaval. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (instancetype)initWithId:(NSNumber *)movieId name:(NSString *)name releaseYear:(NSString *)releaseYear director:(NSString *)director movieIntro:(NSString *)movieIntro moviePosterUrl:(NSString *)moviePosterUrl {
    self = [super init];
    
    if (self) {
        _movieId = movieId;
        _movieName = name;
        _directorName = director;
        _releaseYear = releaseYear;
        _movieIntro = movieIntro;
        _moviePosterUrl = moviePosterUrl;
    }
    
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Movie : %@ \n Director Name: %@ \n Release Year: %@ \n Intro: %@ \n Image Url: %@", self.movieName, self.directorName, self.releaseYear, self.movieIntro, self.moviePosterUrl];
}

@end
