//
//  LoginViewController.h
//  KemiApp
//
//  Created by KEMI on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>
{
	UITextField *userName_;
	UITextField *password_;
	NSArray *textFields_;
}
@property (nonatomic, retain) IBOutlet UITextField *userName;
@property (nonatomic, retain) IBOutlet UITextField *passWord;
@property (retain) NSArray *textFields;

- (IBAction)login:(id)sender;

@end
