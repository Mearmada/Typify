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
    
    if ([self.textField.text isEqualToString:self.currentChallenge.text]) {
        // you winz
        [self.currentTimer invalidate];
        
        NSLog(@"you win! it took you %f seconds", self.elapsedTime);
        
        self.elapsedTime = 0;
    }
}

@end
