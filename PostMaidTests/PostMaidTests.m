//
//  PostMaidTests.m
//  PostMaidTests
//
//  Created by Darren on 7/26/20.
//  Copyright © 2020 hades. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"


@interface PostMaidTests : XCTestCase

@property ViewController *vc;
@property NSMutableDictionary *params;


@end

@implementation PostMaidTests

- (void)setUp {
    _vc = [[ViewController alloc] init];
    _params = [[NSMutableDictionary alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testToJson{
    [_params setValue:@"Bar" forKey:@"Foo"];
    [_params setValue:@"World" forKey:@"Hello"];
    NSData *result = [_vc toJson:_params];
    NSString *testStr = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    NSString *newStr = @"{\n  \"Foo\" : \"Bar\",\n  \"Hello\" : \"World\"\n}";
    NSLog(@"%@", testStr);
    NSLog(@"%@", newStr);
    XCTAssert([testStr isEqualTo:newStr]);
}


@end
