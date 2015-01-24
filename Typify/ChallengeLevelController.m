//
//  ChallengeLevelController.m
//  Typify
//
//  Created by John Heaton on 1/23/15.
//  Copyright (c) 2015 John Heaton. All rights reserved.
//

#import "ChallengeLevelController.h"
#import "Challenge.h"

@implementation ChallengeLevelController

- (id)init {
    self = [super init];
    
    NSLog(@"creating a brand new set of levels");
    
    self.easyChallenges = @[[Challenge challengeWithText:@"Your mom goes to college."],
                            [Challenge challengeWithText:@"poop ass nukka cheese"],
                            [Challenge challengeWithText:@"stanky dank pank bank tank"],
                            [Challenge challengeWithText:@"test test potato" backspacePenalty:5]];
    
    UIFont *mediumFont = [UIFont systemFontOfSize:12];
    self.mediumChallenges = @[[Challenge challengeWithText:@"benjamin franklin doth proclaim thus potato" font:mediumFont]];
    
//    UIFont *Font = [UIFont systemFontOfSize:10];
    UIColor *brightRed = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    UIColor *subFullRed = [UIColor colorWithRed:0.85 green:0 blue:0 alpha:1];
    
    self.hardChallenges = @[[Challenge challengeWithText:@"floccinaucinihilipilification" font:mediumFont textColor:subFullRed backgroundColor:brightRed]];
    
    return self;
}

@end
