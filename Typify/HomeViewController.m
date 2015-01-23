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

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"loadFirstMedium"]) {
        ChallengeViewController *vc = segue.destinationViewController;
        vc.currentChallenge = [ChallengeLevelController new].mediumChallenges.firstObject;
        
    }
}

@end
