//
//  Challenge.m
//  Typify
//
//  Created by John Heaton on 1/23/15.
//  Copyright (c) 2015 John Heaton. All rights reserved.
//

#import "Challenge.h"

@implementation Challenge

+ (Challenge *)challengeWithText:(NSString *)text {
    Challenge *challenge = [self new];
    challenge.text = text;
    return challenge;
}

+ (Challenge *)challengeWithText:(NSString *)text font:(UIFont *)font {
    Challenge *challenge = [self challengeWithText:text];
    challenge.displayTextFont = font;
    return challenge;
}

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