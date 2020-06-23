//
//  SearchMovies
//
//  Created by Dhaval on 4/7/16.
//  Copyright © 2016 Dhaval. All rights reserved.
//

#import "MoviesDataDownloadManager.h"

NSString * const itunesUrl = @"https://itunes.apple.com/search?";
@interface MoviesDataDownloadManager () {
    NSMutableString *_itunesUrlParameters;
    NSURLSession *_urlSession;
}

@property (nonatomic, strong) NSString *itunesUrlParameters;

@end


@implementation MoviesDataDownloadManager

- (void)downloadJSONForSearchTerm:(NSString *)searchTerm {
    NSString *urlString = [self buildUrl:searchTerm];
    NSURL *itunesUrl = [[NSURL alloc] initWithString:urlString];

    __block NSDictionary *jsonObj = nil;
    [[self.urlSession dataTaskWithURL:itunesUrl completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
            if (httpResp.statusCode == 200) {
                NSError *jsonError;
                jsonObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
                if (!jsonError) {
                    [self.downloadDelegate downloadSearchResultDictionary:jsonObj];
                }
            }
        }
    }] resume];
}

#pragma mark Private method

- (NSString *)buildUrl:(NSString *)searchTerm {
    NSMutableString *url = [[NSMutableString alloc] initWithString:itunesUrl];
    return [url stringByAppendingFormat:@"term=%@%@", searchTerm, self.itunesUrlParameters];
}

- (NSString *)itunesUrlParameters {
    _itunesUrlParameters = [[NSMutableString alloc] init];
    [_itunesUrlParameters appendString:@"&media=movie"];
    [_itunesUrlParameters appendString:@"&entity=movie"];
    [_itunesUrlParameters appendString:@"&attribute=movieTerm"];
    
    return _itunesUrlParameters;
}

- (NSURLSession *)urlSession {
    if (!_urlSession) {
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        [sessionConfiguration setHTTPAdditionalHeaders:@{@"Accept": @"application/json"}];
        sessionConfiguration.timeoutIntervalForRequest = 20.0;
        sessionConfiguration.timeoutIntervalForResource = 60.0;
        sessionConfiguration.HTTPMaximumConnectionsPerHost = 2;
        [sessionConfiguration setAllowsCellularAccess:YES];
        
        NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
        operationQueue.maxConcurrentOperationCount = 2;
        
        _urlSession = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:nil delegateQueue:operationQueue];
    }
    
    return _urlSession;
}

@end
