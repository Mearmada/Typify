//
//  ViewController.m
//  Typify
//
//  Created by John Heaton on 1/23/15.
//  Copyright (c) 2015 John Heaton. All rights reserved.
//

#import "ChallengeViewController.h"
#import "Challenge.h"

@import AVFoundation;

@interface ChallengeViewController () <UITextFieldDelegate>

@property (nonatomic) IBOutlet UITextField *textField;
@property (nonatomic) IBOutlet UILabel *textToTypeLabel;
@property (nonatomic) IBOutlet UILabel *timerLabel;

@property (nonatomic) double elapsedTime;
@property (nonatomic) NSTimer *currentTimer;

@end

@implementation ChallengeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.currentChallenge != nil) {
        [self startChallenge:self.currentChallenge];
        self.title = [NSString stringWithFormat:@"Challenge %d", self.challengeIndex + 1];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.textField addTarget:self action:@selector(correctnessChecker) forControlEvents:UIControlEventEditingChanged];
}

- (NSArray *)keyCommands {
    return @[[UIKeyCommand keyCommandWithInput:@"r" modifierFlags:UIKeyModifierCommand action:@selector(restartCurrentChallenge:)]];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL isBackspace = range.length == 1 && string.length == 0;
    
    if (isBackspace) {
        if (self.currentChallenge.backspacePenalty != 0) {
            self.elapsedTime += self.currentChallenge.backspacePenalty;
            self.timerLabel.text = [NSString stringWithFormat:@"Elapsed time: %.02f seconds", self.elapsedTime];
        }
    }
    
    return YES;
}

- (void)startChallenge:(Challenge *)challenge {
    self.currentChallenge = challenge;
    
    self.elapsedTime = 0;
    
    self.textToTypeLabel.text = challenge.text;
    self.textField.text = @"";
    self.textToTypeLabel.textColor = challenge.displayTextColor;
    self.textToTypeLabel.backgroundColor = challenge.displayBackgroundColor;
    self.textToTypeLabel.font = challenge.displayTextFont;
    
    [self.textField becomeFirstResponder];
    
    self.currentTimer = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
}

- (IBAction)restartCurrentChallenge:(id)sender {
    [self.currentTimer invalidate];
    [self startChallenge:self.currentChallenge];
}

- (void)timerFired {
    self.elapsedTime += 0.01;
    
    self.timerLabel.text = [NSString stringWithFormat:@"Elapsed time: %.02f seconds", self.elapsedTime];
    

}

- (void)correctnessChecker {
    
    BOOL fullyMatches = [self.textField.text isEqualToString:self.currentChallenge.text];
    BOOL beginningMatches = [self.currentChallenge.text hasPrefix:self.textField.text];
    
    if (fullyMatches == YES) {
        
        [self.currentTimer invalidate];
        
        NSLog(@"You Win! it took you %f seconds", self.elapsedTime);
        
        self.elapsedTime = 0;
        [self.textField resignFirstResponder];
    }
    else if (beginningMatches == NO) {

        if (self.textField.text.length == 0) {
            //for if there isnt anything in the text field, cant be wrong if they havnt typed.
            NSLog(@"You have not typed anything.");
        }
        else {
            NSLog(@"Oops, you have made a mistake!");
            self.textField.textColor = [UIColor redColor];
        }
    }
    else if (beginningMatches == YES) {
        self.textField.textColor = [UIColor blackColor];
    }
}

@end
