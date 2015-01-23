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
    
    self.easyChallenges = @[[Challenge challengeWithText:@"Your mom goes to college."],
                            [Challenge challengeWithText:@"poop ass nukka cheese"],
                            [Challenge challengeWithText:@"stanky dank pank bank tank"]];
    
    UIFont *smallFont = [UIFont systemFontOfSize:10];
    self.mediumChallenges = @[[Challenge challengeWithText:@"benjamin franklin doth proclaim thus potato" font:smallFont]];
    
    return self;
}

@end
