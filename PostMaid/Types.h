//
//  Types.h
//  PostMaid
//
//  Created by Darren on 12/26/20.
//  Copyright © 2020 hades. All rights reserved.
//
#import <Foundation/Foundation.h>

#ifndef Types_h
#define Types_h

#define TRUE 1
#define FALSE 0


typedef void (^Response) (id response);
typedef void (*Callback) (id result);

typedef void (^Failure) (id error);


#endif /* Types_h */
