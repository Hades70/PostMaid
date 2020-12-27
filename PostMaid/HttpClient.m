//
//  HttpClient.m
//  PostMaid
//
//  Created by Darren on 7/26/20.
//  Copyright © 2020 hades. All rights reserved.
//

#import "HttpClient.h"
#import <AFNetworking/AFNetworking.h>

#import "Types.h"

@implementation HttpClient

static HttpClient *instance = nil;

+ (HttpClient *)sharedInstance{
    @synchronized ([HttpClient class]) {
        if (!instance){
            instance = [[self alloc] init];
        }
        return instance;
    }
}


- (void)get:(NSString *)url withHeaders:(NSDictionary *) headers withParams:(NSDictionary *) params completion:(Response) completion failure:(Failure) failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:params headers:headers progress:nil success:^(NSURLSessionTask * task, id  _Nullable responseObject) {
        completion(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}



- (void)post:(NSString *)url withHeaders:(NSDictionary *) headers withParams:(NSDictionary *) params completion:(Response) completion failure:(Failure) failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:url parameters:params headers:headers progress:nil success:^(NSURLSessionTask * task, id  _Nullable responseObject) {
        completion(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}

@end
