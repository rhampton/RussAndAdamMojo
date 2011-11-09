//
//  LoginViewController.m
//  KemiApp
//
//  Created by KEMI on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "PolicySearchViewController.h"
#import "ASIHTTPRequest.h"
#import "Request.h"

@implementation LoginViewController

@synthesize userName = userName_;
@synthesize passWord = password_;
@synthesize textFields = textFields_;

 -(void)callFinished:(NSString*)response{
     BOOL isAuthorized = false;
 
     NSLog(@"I am logging too:%@", response);
     
     // TODO disable spinner at this point
     
     if([response rangeOfString:@"true"].location!=NSNotFound)
         isAuthorized=true;
     
     if(isAuthorized)
     {
         NSLog(@"%@", @"Access Granted");
         
         PolicySearchViewController* psVC = [[[PolicySearchViewController alloc] init] autorelease];
         
         [[self navigationController] pushViewController:psVC animated:YES];
         
     }
     else
     {
         NSLog(@"%@", @"Access Denied");
         UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Invalid Login" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil] autorelease];
         
         [alert show];
     }
         
 }
 
 - (BOOL)validateUser:(NSString *)userName withPassword:(NSString *)password
 {
 if([userName length] == 0 || [password length] == 0)
 return NO;
 
 NSString* loginurl=@"http://tao2.kemi.com/wcfrussell/kemisvc.svc/json/logincheck/%@/%@";
 
 NSString* location=[NSString stringWithFormat:loginurl, userName, password];
 
 Request* r=[[Request alloc] init];
 [r setDelegate:self];
 [r openURLAsync:location];

 return false;
}

- (void) viewWillAppear:(BOOL)animated
{
	[[self navigationController] setNavigationBarHidden:YES];
	[[self userName] setText:@""];
	[[self passWord] setText:@""];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[[self navigationItem] setTitle:@"Logout"];
}

- (void) viewDidLoad
{
	[self setTextFields:[NSArray arrayWithObjects:userName_, password_, nil]];
	[super viewDidLoad];
}

- (void) viewDidUnload
{
	[self setUserName:nil];
	[self setPassWord:nil];
	[super viewDidUnload];
}

- (IBAction)login:(id)sender
{
	[self performLogin];
}

- (void)performLogin
{
    // TODO enable spinner
    [self validateUser:[[self userName] text] withPassword:[[self passWord] text]];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	int i = [textFields_ indexOfObject:textField];
	if(i < [textFields_ count] - 1){
		UITextField *nextTextField = [textFields_ objectAtIndex:i+1];
		[nextTextField becomeFirstResponder];
	}else{
		[textField resignFirstResponder];
		[self performLogin];
	}
	return TRUE;
}

- (id)init
{
	self = [super init];
	if(self){
        // Do stuff
	}
	return self;
}

- (void) dealloc
{
	[userName_ release];
	[password_ release];
	[super dealloc];
}


@end
