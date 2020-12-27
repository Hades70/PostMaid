//
//  ViewController.h
//  PostMaid
//
//  Created by Darren on 7/26/20.
//  Copyright © 2020 hades. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ViewController : NSViewController
@property (weak) IBOutlet NSTextField *urlLabel;
@property (weak) IBOutlet NSPopUpButton *selectedHttpMethod;

@property (weak) IBOutlet NSTextField *headerKeyLabel;
@property (weak) IBOutlet NSTextField *headerValueLabel;
@property (unsafe_unretained) IBOutlet NSTextView *headersLabel;

@property (weak) IBOutlet NSTextField *paramKeyLabel;
@property (weak) IBOutlet NSTextField *ParamValueLabel;
@property (unsafe_unretained) IBOutlet NSTextView *paramsLabel;
@property (weak) IBOutlet NSTextField *outerKey;


@property (unsafe_unretained) IBOutlet NSTextView *responseLabel;

@property (strong, nonatomic) NSMutableDictionary *headers;
@property (strong, nonatomic) NSMutableDictionary *params;

-(NSData *)toJson:(NSDictionary *) dict;

@end

