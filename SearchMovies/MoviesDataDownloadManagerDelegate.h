//
//  SearchMovies
//
//  Created by Dhaval on 4/7/16.
//  Copyright © 2016 Dhaval. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MoviesDataDownloadManagerDelegate <NSObject>

- (void)downloadSearchResultDictionary:(NSDictionary *)searchedResultDictionary;

@end
