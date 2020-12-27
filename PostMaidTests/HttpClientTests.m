//
//  HttpClientTests.m
//  PostMaidTests
//
//  Created by Darren on 12/26/20.
//  Copyright © 2020 hades. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HttpClient.h"

@interface HttpClientTests : XCTestCase

@property HttpClient *client;

@end

@implementation HttpClientTests

- (void)setUp {
    _client = [HttpClient sharedInstance];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testHTTPClient {
    XCTAssert([_client isNotEqualTo:NULL]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
