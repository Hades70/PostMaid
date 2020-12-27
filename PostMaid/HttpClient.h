//
//  HttpClient.h
//  PostMaid
//
//  Created by Darren on 7/26/20.
//  Copyright © 2020 hades. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HttpClient : NSObject

+(HttpClient *)sharedInstance;

-(void)get:(NSString *)url withHeaders:(NSDictionary *) headers withParams:(NSDictionary *) params completion:(void (^)(id response)) completion failure:(void (^)(id e)) failure;
-(void)post:(NSString *)url withHeaders:(NSDictionary *) headers withParams:(NSDictionary *) params completion:(void (^)(id response)) completion failure:(void (^)(id e)) failure;
@end


NS_ASSUME_NONNULL_END
