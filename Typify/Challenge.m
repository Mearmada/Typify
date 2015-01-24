//
//  Challenge.m
//  Typify
//
//  Created by John Heaton on 1/23/15.
//  Copyright (c) 2015 John Heaton. All rights reserved.
//

#import "Challenge.h"

@implementation Challenge

+ (NSArray *)challengesFromFile:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    NSMutableArray *challenges = [[NSMutableArray alloc] init];
    for (NSDictionary *challengeJSON in [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:0 error:nil]) {
        Challenge *c = [Challenge challengeWithText:challengeJSON[@"text"] backspacePenalty:[challengeJSON[@"backspacePenalty"] doubleValue]];
        
        NSArray *objects;
        if ((objects = challengeJSON[@"textColor"]) != nil) {
            CGFloat r,g,b,a;
            r = [objects[0] floatValue];
            g = [objects[1] floatValue];
            b = [objects[2] floatValue];
            a = [objects[3] floatValue];
            
            c.displayTextColor = [UIColor colorWithRed:r / 255 green:g / 255 blue:b / 255 alpha:a / 255];
        }
        
        NSDictionary *dict;
        if ((dict = challengeJSON[@"font"]) != nil) {
            c.displayTextFont = [UIFont fontWithName:dict[@"name"] size:[dict[@"size"] intValue]];
        }
        
        [challenges addObject:c];
    }
    return challenges.copy;
}

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

+ (Challenge *)challengeWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor backgroundColor:(UIColor *)color {
    Challenge *challenge = [self challengeWithText:text font:font];
    challenge.displayTextColor = textColor;
    challenge.displayBackgroundColor = color;
    return challenge;
}

+ (Challenge *)challengeWithText:(NSString *)text backspacePenalty:(double)penalty {
    Challenge *challenge = [self challengeWithText:text];
    challenge.backspacePenalty = penalty;

    return challenge;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@, text=%@", [super description], self.text];
}

- (id)init {
    self = [super init];
    
    self.speaksText = NO;
    self.displaysText = YES;
    self.displayTextColor = [UIColor blackColor];
    self.displayBackgroundColor = [UIColor whiteColor];
    self.displayTextFont = [UIFont systemFontOfSize:20];
    self.backspacePenalty = 0;
    
    return self;
}

@end