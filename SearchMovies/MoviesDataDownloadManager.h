//
//  SearchMovies
//
//  Created by Dhaval on 4/7/16.
//  Copyright © 2016 Dhaval. All rights reserved.
//

@import CoreFoundation;
#import "MoviesDataDownloadManagerDelegate.h"

@interface MoviesDataDownloadManager : NSObject

@property (nonatomic, strong, readonly, nonnull) NSURLSession *urlSession;
@property (nonatomic, weak, nullable) id<MoviesDataDownloadManagerDelegate> downloadDelegate;

- (void)downloadJSONForSearchTerm:(NSString * _Nonnull)searchTerm;

@end
