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
    
    self.easyChallenges = [Challenge challengesFromFile:@"easy"];
    self.mediumChallenges = [Challenge challengesFromFile:@"medium"];
    self.hardChallenges = [Challenge challengesFromFile:@"hard"];
    self.expertChallenges = [Challenge challengesFromFile:@"expert"];
    self.masterChallenges = [Challenge challengesFromFile:@"master"];
    
    return self;
}

@end
