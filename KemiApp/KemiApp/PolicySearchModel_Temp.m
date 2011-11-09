//
//  PolicySearchModel_Temp.m
//  KemiApp
//
//  Created by KEMI on 10/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PolicySearchModel_Temp.h"
#import "Request.h"

@implementation PolicySearchModel_Temp (hidden)

+ (NSMutableArray *)getRandomDates:(int)numberOfdates
{
	NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"MM/dd/yyyy"];	
	NSMutableArray *dates = [[[NSMutableArray alloc] init] autorelease];
	for(int x = 0; x < numberOfdates; x++)
	{
		NSDate *dt = [self getRandomDate];
		NSDate *dt2 = [dt dateByAddingTimeInterval:60*60*24*365];
		NSString *plcyPerBegin = [dateFormatter stringFromDate:dt];
		NSString *plcyPerEnd = [dateFormatter stringFromDate:dt2];
		//NSString *dateString = [dateFormatter stringFromDate:d];
		[dates addObject:[NSString stringWithFormat:@"%@ - %@", plcyPerBegin, plcyPerEnd]];
		//[dates addObject:[self getRandomDate]] ;
	}
	[dates sortUsingSelector:@selector(compare:)];
	[dateFormatter release];
	return dates;
}

+ (NSDate *)getRandomDate
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateStyle:NSDateFormatterShortStyle];
	
	int m = (rand() % 11) + 1;
	
	int d;
	if(m == 9 || m == 4 || m == 6 || m == 11)
		d = (rand() % 30) + 1;
	else
		d = (rand() % 29) + 1;
	
	if(m == 2)
		d = 28;
	
	int y = (rand() % 14) + 1996;
	
	NSDate *dt = [dateFormatter dateFromString:[NSString stringWithFormat:@"%d/%d/%d", m,d,y]];
	
	[dateFormatter release];
	
	return dt;
}

@end


@implementation PolicySearchModel_Temp

NSString* getpolicyperiodsurl=@"http://tao2.kemi.com/wcfrussell/kemisvc.svc/json/getpolicyperiods/%@";

+ (NSMutableArray *)searchPolicies:(NSString *)policyNumber
{
    NSString* requrl=[NSString stringWithFormat:getpolicyperiodsurl, policyNumber];
    id resOrErr= [Request responseStringOrError:requrl];
    NSLog(@"Object: %@", resOrErr);
    
    if(resOrErr!=nil){
        // TODO parse JSON response into NSMutableArray
        int numberOfPeriodsFound = rand() % 12;
        
        NSLog(@"Policy %@ found! Returning %d dates", policyNumber, numberOfPeriodsFound);
        
        return [self getRandomDates:numberOfPeriodsFound];
    }
    
    NSLog(@"Policy not found");
    return nil;
}



@end
