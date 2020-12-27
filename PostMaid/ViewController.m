//
//  ViewController.m
//  PostMaid
//
//  Created by Darren on 7/26/20.
//  Copyright © 2020 hades. All rights reserved.
//

#import "ViewController.h"
#import "HttpClient.h"


@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.headers = [[NSMutableDictionary alloc] init];
    self.params = [[NSMutableDictionary alloc] init];
    
    [self.headersLabel setEditable:false];
    [self.paramsLabel setEditable:false];
    [self.responseLabel setEditable:false];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

- (NSData *)toJson:(NSDictionary *)dict {
    NSError *error;
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    return jsonData;
}

- (IBAction)addHeaderPressed:(id)sender {
    [self.headers setValue:[self.headerValueLabel stringValue] forKey:[self.headerKeyLabel stringValue]];
    [self.headersLabel setString:[self.headers description]];
    [self.headerKeyLabel setStringValue:@""];
    [self.headerValueLabel setStringValue:@""];

}
- (IBAction)addParamPressed:(id)sender {
//    NSArray *arrComponents = [[self.paramKeyLabel stringValue] componentsSeparatedByString:@"["];
//    if ([arrComponents count] > 1) {
//        if ([self.params objectForKey:[arrComponents[0] stringValue]]) {
//            
//            [[self.params objectForKey:[arrComponents[0] stringValue]] setValue:[self.ParamValueLabel stringValue] forKey:[self.paramKeyLabel stringValue]];
//        } else {
//           // [self.params setValue:new forKey:[self.outerKey stringValue]];
//        }
//    }
    
    if (![[self.outerKey stringValue]  isEqual: @""]){
        NSMutableDictionary *new = [[NSMutableDictionary alloc]init];
        [new setValue:[self.ParamValueLabel stringValue] forKey:[self.paramKeyLabel stringValue]];
        
        if ([self.params objectForKey:[self.outerKey stringValue]]) {
            [[self.params objectForKey:[self.outerKey stringValue]] setValue:[self.ParamValueLabel stringValue] forKey:[self.paramKeyLabel stringValue]];
        } else {
            [self.params setValue:new forKey:[self.outerKey stringValue]];
        }
    }else {
        [self.params setValue:[self.ParamValueLabel stringValue] forKey:[self.paramKeyLabel stringValue]];
    }
    [self.paramsLabel setString:[self.params description]];
    [self.paramKeyLabel setStringValue:@""];
    [self.ParamValueLabel setStringValue:@""];
    [self.outerKey setStringValue:@""];
    
    
}
- (IBAction)sendRequest:(id)sender {
    HttpClient *client = [HttpClient sharedInstance];

    if ( [self.urlLabel stringValue] == nil) {
        return;
    }
    
    NSDictionary *_headers;
    NSDictionary *_params;
    
    if (self.headers.count) {
        _headers = self.headers;
    }
    if (self.params.count) {
        _params = self.params;
    }
    
        
    if ([[[self.selectedHttpMethod selectedItem] title] isEqualToString:@"GET"]) {
    
        [client get:[self.urlLabel stringValue] withHeaders:_headers withParams:_params completion:^(id  _Nonnull response) {
            [self.responseLabel setString:[(NSArray *)response description]];
        } failure:^(id  _Nonnull e) {
            [self.responseLabel setString:[e description]];
        }];
    } else {
        [client post:[self.urlLabel stringValue] withHeaders:_headers withParams:_params completion:^(id  _Nonnull response) {
            [self.responseLabel setString:[(NSArray *)response description]];
        } failure:^(id  _Nonnull e) {
            [self.responseLabel setString:[e description]];
        }];
    }
}
- (IBAction)clearHeaders:(id)sender {
    [self.headers removeAllObjects];
        [self.headersLabel setString:[self.headers description]];
}
- (IBAction)clearParams:(id)sender {
    [self.params removeAllObjects];
        [self.paramsLabel setString:[self.params description]];
}



@end
