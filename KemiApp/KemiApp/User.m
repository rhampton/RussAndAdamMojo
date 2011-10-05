//
//  User.m
//  KemiApp
//
//  Created by KEMI on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize user, password;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        user=nil;
        password=nil;
    }
    
    return self;
}

+(BOOL) validateUser:(NSString *)user withPassword:(NSString *)password{
    // todo: insert ws call to tao2 svc supplying user/pass and ...
    
    return true;
}

@end
