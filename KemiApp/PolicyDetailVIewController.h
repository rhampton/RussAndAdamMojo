//
//  PolicyDetailVIewController.h
//  KemiApp
//
//  Created by KEMI on 10/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PolicyModel_Temp.h"

@interface PolicyDetailVIewController : UITableViewController{
	PolicyModel_Temp *policy_;
}

@property (nonatomic, retain) PolicyModel_Temp *policy;


@end
