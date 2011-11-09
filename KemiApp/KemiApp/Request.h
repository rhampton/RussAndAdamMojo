//
//  Request.h
//  KemiApp
//
//  Created by KEMI on 11/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WSCallComplete <NSObject>
@required
-(void)callFinished:(NSString*)response;
@end

@interface Request : NSObject {
    id delegate;
}
@property (nonatomic, assign) id <WSCallComplete> delegate;

+(id)responseStringOrError:(NSString *)location;
-(void)openURLAsync:(NSString*)location;

@end
