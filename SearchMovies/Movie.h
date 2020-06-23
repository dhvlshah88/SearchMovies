//
//  Movie.h
//  SearchMovies
//
//  Created by Dhaval on 4/7/16.
//  Copyright © 2016 Dhaval. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong, readonly) NSNumber *movieId;
@property (nonatomic, strong, readonly) NSString *movieName;
@property (nonatomic, strong, readonly) NSString *directorName;
@property (nonatomic, strong, readonly) NSString *movieIntro;
@property (nonatomic, strong, readonly) NSString *releaseYear;
@property (nonatomic, strong, readonly) NSString *moviePosterUrl;

- (instancetype)initWithId:(NSNumber *)movieId name:(NSString *)name releaseYear:(NSString *)releaseYear director:(NSString *)director movieIntro:(NSString *)movieIntro moviePosterUrl:(NSString *)moviePosterUrl;

@end
