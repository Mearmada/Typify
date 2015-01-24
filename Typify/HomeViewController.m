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
#import "DifficultyTableViewController.h"

@interface HomeViewController ()

@property (nonatomic) ChallengeLevelController *levelController;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.levelController = [ChallengeLevelController new];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"loadEasyChallenges"]) {
        DifficultyTableViewController *vc = segue.destinationViewController;
        vc.challengesArray = self.levelController.easyChallenges;
        vc.title = @"Easy Challenges";
    }
    else if ([segue.identifier isEqualToString:@"loadMediumChallenges"]) {
        DifficultyTableViewController *vc = segue.destinationViewController;
        vc.challengesArray = self.levelController.mediumChallenges;
        vc.title = @"Medium Challenges";
    }
    else if ([segue.identifier isEqualToString:@"loadHardChallenges"]) {
        DifficultyTableViewController *vc = segue.destinationViewController;
        vc.challengesArray = self.levelController.hardChallenges;
        vc.title = @"Hard Challenges";
    }
    else if ([segue.identifier isEqualToString:@"loadExpertChallenges"]) {
        DifficultyTableViewController *vc = segue.destinationViewController;
        vc.challengesArray = self.levelController.expertChallenges;
        vc.title = @"Expert Challenges";
    }
    else if ([segue.identifier isEqualToString:@"loadMasterChallenges"]) {
        DifficultyTableViewController *vc = segue.destinationViewController;
        vc.challengesArray = self.levelController.masterChallenges;
        vc.title = @"Master Challenges";
    }
}

@end
