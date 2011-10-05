//
//  User.h
//  KemiApp
//
//  Created by KEMI on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, retain) NSString *user;
@property (nonatomic, retain) NSString *password;

+(BOOL) validateUser:(NSString*)user withPassword:(NSString*)password;

@end
