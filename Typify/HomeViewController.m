//
//  HomeViewController.m
//  Typify
//
//  Created by John Heaton on 1/23/15.
//  Copyright (c) 2015 John Heaton. All rights reserved.
//

#import "HomeViewController.h"
#import "ChallengeViewController.h"
#import "ChallengeLevelController.h"

@interface HomeViewController ()

@property (nonatomic) ChallengeLevelController *levelController;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.levelController = [ChallengeLevelController new];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"loadFirstEasy"]) {
        ChallengeViewController *vc = segue.destinationViewController;
        
        Challenge *randomChallenge = self.levelController.easyChallenges[arc4random() % self.levelController.easyChallenges.count];
        
        vc.currentChallenge = randomChallenge;
    }
    else if ([segue.identifier isEqualToString:@"loadFirstMedium"]) {
        ChallengeViewController *vc = segue.destinationViewController;
        vc.currentChallenge = [ChallengeLevelController new].mediumChallenges.firstObject;
    }
    else if ([segue.identifier isEqualToString:@"loadFirstHard"]) {
        ChallengeViewController *vc = segue.destinationViewController;
        vc.currentChallenge = self.levelController.hardChallenges.firstObject;
    }
}

@end
