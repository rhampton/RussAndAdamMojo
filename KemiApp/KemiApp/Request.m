//
//  Request.m
//  KemiApp
//
//  Created by KEMI on 11/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Request.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

@implementation Request

@synthesize delegate;

+(id)responseStringOrError:(NSString*)location{
    NSURL* url=[NSURL URLWithString:location];
    ASIHTTPRequest* req=[ASIHTTPRequest requestWithURL:url];
    [req setValidatesSecureCertificate:FALSE];
    [req setRequestHeaders:[NSMutableDictionary dictionaryWithObject:@"application/json" forKey:@"Accept"]];
    [req startSynchronous];
    NSError* err=[req error];
    if(!err){
        return [req responseString];
    }
    
    return err;
}

-(id)init{
    self=[super init];
    if(self){
        // Do stuff
    }
    
    return self;
}

-(void)openURLAsync:(NSString*)location{
    NSURL* url=[NSURL URLWithString:location];
    NSLog(@"Opening url with location %@", url );
    ASIHTTPRequest* request = [ASIHTTPRequest requestWithURL:url];
    [request setValidatesSecureCertificate:FALSE];
    [request addRequestHeader:@"Accept" value:@"application/json"];
    [request setDelegate:self];   
    [request startAsynchronous];
}

-(void)requestFinished:(ASIHTTPRequest*)request{
    NSString* response = [request responseString];
    NSLog(@"Request::requestFinished: %@", response);
    [delegate callFinished:response];
}

-(void)requestFailed:(ASIHTTPRequest*)request{
    NSLog(@"HERE B");
    NSError* error=[request error];
    NSLog(@"Error: %@", error.localizedDescription);
    [delegate callFinished:@"ERROR"];
}

/*
-(void)openURLAsync:(id)sender userName:(NSString*) username password:(NSString*) password{
    NSString* location=[NSString stringWithFormat:loginurl, username, password];
    NSURL* url=[NSURL URLWithString:location];
    ASIHTTPRequest* request=[ASIHTTPRequest requestWithURL:url];
    [request setValidatesSecureCertificate:FALSE];
    [request addRequestHeader:@"Accept" value:@"application/json"];
    [request setDelegate:self];
    [request startAsynchronous];
}

-(void)requestFinished:(ASIHTTPRequest*)request{
    NSString* response=[request responseString];
    NSLog(@"Response %i: %@", request.responseStatusCode, response);
    x=1;
}

-(void)requestFailed:(ASIHTTPRequest*)request{
    NSError* error=[request error];
    NSLog(@"Error: %@", error.localizedDescription);
    x=2;
}
*/
@end
