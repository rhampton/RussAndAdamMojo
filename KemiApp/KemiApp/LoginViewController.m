//
//  LoginViewController.m
//  KemiApp
//
//  Created by KEMI on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

@synthesize userName = userName_;
@synthesize passWord = password_;
@synthesize textFields = textFields_;
@synthesize receivedData = receivedData_;

- (void) viewDidLoad
{
	self.textFields = [NSArray arrayWithObjects:userName_, password_, nil];
//    self.receivedData = [[NSMutableArray alloc] init];
	[super viewDidLoad];
}

- (void) viewDidUnload
{
	[self setUserName:nil];
	[self setPassWord:nil];
    [self setReceivedData:nil];
	[super viewDidUnload];
}

- (IBAction)login:(id)sender
{
	NSLog(@"Username: %@, Password: %@", self.userName.text, self.passWord.text);
    [LoginViewController test];
}

+ (void)test{
    /*
     // Construct a URL with the link string of the item
     NSURL *url = [NSURL URLWithString:[entry link]];
     // Construct a requst object with that URL
     NSURLRequest *req = [NSURLRequest requestWithURL:url];
     */
    NSURL *url = [NSURL URLWithString:@"http://tao2.kemi.com/wcfrussell/kbi.svc?wsdl"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSLog(@"req is %@", req);
    NSMutableArray *receivedData=[[NSMutableArray alloc] init];
    
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:req delegate:self];
    if (theConnection) {
        // Create the NSMutableData to hold the received data.
        // receivedData is an instance variable declared elsewhere.
        receivedData = [[NSMutableData data] retain];
        [receivedData = [theConnection 
        NSLog(@"--> %@",receivedData.count );
    } else {
        // Inform the user that the connection failed.
        NSLog(@"Connection failed");
    }
    
    [receivedData release];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // This method is called when the server has determined that it
    // has enough information to create the NSURLResponse.
    
    // It can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    
    // receivedData is an instance variable declared elsewhere.
    [receivedData_ setLength:0];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	int i = [textFields_ indexOfObject:textField];
	if(i < [textFields_ count] - 1){
		UITextField *nextTextField = [textFields_ objectAtIndex:i+1];
		[nextTextField becomeFirstResponder];
	}else{
		[textField resignFirstResponder];
	}
	return TRUE;
}

- (void) dealloc
{
	[userName_ release];
	[password_ release];
    [receivedData_ release];
	[super dealloc];
}


@end
