//
//  SearchMovies
//
//  Created by Dhaval on 4/7/16.
//  Copyright © 2016 Dhaval. All rights reserved.
//

@import Foundation;

@interface MovieDataUtil : NSObject

+ (NSArray *)moviesFromJSONData:(NSDictionary *)jsonData;

+ (NSDate *)releaseDateForRFC3339String:(NSString *)movieReleaseDate usingFormatter:(NSDateFormatter *)dateFormatter;

+ (NSString *)releaseYearFromDate:(NSDate *)releaseDate usingFormatter:(NSDateFormatter *)dateFormatter;

@end
