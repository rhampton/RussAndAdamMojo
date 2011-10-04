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


- (void) viewDidLoad
{
	self.textFields = [NSArray arrayWithObjects:userName_, password_, nil];
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
	NSLog(@"Username: %@, Password: %@", self.userName.text, self.passWord.text);
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
	[super dealloc];
}


@end
