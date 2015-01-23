//
//  ViewController.m
//  Typify
//
//  Created by John Heaton on 1/23/15.
//  Copyright (c) 2015 John Heaton. All rights reserved.
//

#import "ViewController.h"

/*
 what makes up a challenge for this app?
 
 - text must be typed and match without mistakes
 - static time limits for different medal ranks
 - multiple presentation options:
    - voice
    - text on screen
        - presentation color profiles for background and foreground color
        - font size
 
 */

@interface Challenge : NSObject

@property (nonatomic) NSString *text;
@property (nonatomic) BOOL speaksText;
@property (nonatomic) BOOL displaysText;
@property (nonatomic) UIColor *displayTextColor;
@property (nonatomic) UIColor *displayBackgroundColor;
@property (nonatomic) UIFont *displayTextFont;

@end

@implementation Challenge

- (id)init {
    self = [super init];
    
    self.speaksText = NO;
    self.displaysText = YES;
    self.displayTextColor = [UIColor blackColor];
    self.displayBackgroundColor = [UIColor whiteColor];
    self.displayTextFont = [UIFont systemFontOfSize:20];
    
    return self;
}

@end


@interface ViewController ()

@property (nonatomic) IBOutlet UITextField *textField;
@property (nonatomic) IBOutlet UILabel *textToTypeLabel;
@property (nonatomic) IBOutlet UILabel *timerLabel;

@property (nonatomic) double elapsedTime;
@property (nonatomic) Challenge *currentChallenge;
@property (nonatomic) NSTimer *currentTimer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Challenge *firstChallenge = [Challenge new];
    firstChallenge.text = @"poop poop poop";
    
    [self startChallenge:firstChallenge];
}

- (void)startChallenge:(Challenge *)challenge {
    self.currentChallenge = challenge;
    
    self.textToTypeLabel.text = challenge.text;
    self.textField.text = @"";
    self.textToTypeLabel.textColor = challenge.displayTextColor;
    self.textToTypeLabel.backgroundColor = challenge.displayBackgroundColor;
    self.textToTypeLabel.font = challenge.displayTextFont;
    
    self.currentTimer = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
}

- (void)timerFired {
    self.elapsedTime += 0.01;
    
    self.timerLabel.text = [NSString stringWithFormat:@"Elapsed time: %.02f seconds", self.elapsedTime];
    
    if ([self.textField.text isEqualToString:self.currentChallenge.text]) {
        // you winz
        [self.currentTimer invalidate];
        
        NSLog(@"you win bitch. it took you %f seconds", self.elapsedTime);
        
        self.elapsedTime = 0;
    }
}

@end
