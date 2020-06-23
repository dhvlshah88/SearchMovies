//
//  MovieDataUtil.m
//  SearchMovies
//
//  Created by Dhaval on 4/7/16.
//  Copyright © 2016 Dhaval. All rights reserved.
//

#import "MovieDataUtil.h"
#import "Movie.h"

NSString * const kMovieResult = @"results";
NSString * const kMovieIDKey = @"trackId";
NSString * const kMovieNameKey = @"trackName";
NSString * const kMovieDirectorNameKey = @"artistName";
NSString * const kMovieReleaseYearkey = @"releaseDate";
NSString * const kMovieIntrokey = @"shortDescription";
NSString * const kMovieArtworkUrlKey = @"artworkUrl30";
NSString * const kRFC3339ReleaseDateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
NSString * const kMovieReleaseYearFormat = @"yyyy";

@implementation MovieDataUtil

+ (NSArray *)moviesFromJSONData:(NSDictionary *)jsonData {
    NSMutableArray *movies = [[NSMutableArray alloc] init];
    if (!jsonData || jsonData.count == 0) {
        return movies;
    }
    
    NSArray *movieDetailsList = [jsonData objectForKey:kMovieResult];
    for (NSDictionary *movieDetail in movieDetailsList) {
        NSNumber *movieId = [movieDetail objectForKey:kMovieIDKey];
        Movie *movie = [[Movie alloc]
                            initWithId:movieId
                            name:[movieDetail objectForKey:kMovieNameKey]
                            releaseYear:[movieDetail objectForKey:kMovieReleaseYearkey] 
                            director:[movieDetail objectForKey:kMovieDirectorNameKey]
                            movieIntro:[movieDetail objectForKey:kMovieIntrokey]
                            moviePosterUrl:[movieDetail objectForKey:kMovieArtworkUrlKey]
                        ];
        [movies addObject:movie];
    }

    return movies;
}

+ (NSDate *)releaseDateForRFC3339String:(NSString *)movieReleaseDate usingFormatter:(NSDateFormatter *)dateFormatter {
    dateFormatter.dateFormat = kRFC3339ReleaseDateFormat;
    dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    return [dateFormatter dateFromString:movieReleaseDate];
}

+ (NSString *)releaseYearFromDate:(NSDate *)releaseDate usingFormatter:(NSDateFormatter *)dateFormatter {
    dateFormatter.dateFormat = kMovieReleaseYearFormat;
    return [dateFormatter stringFromDate:releaseDate];
}

@end
