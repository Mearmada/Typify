//
//  Challenge.h
//  Typify
//
//  Created by John Heaton on 1/23/15.
//  Copyright (c) 2015 John Heaton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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

+ (NSArray *)challengesFromFile:(NSString *)name;

+ (Challenge *)challengeWithText:(NSString *)text;
+ (Challenge *)challengeWithText:(NSString *)text font:(UIFont *)font;
+ (Challenge *)challengeWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor backgroundColor:(UIColor *)color;
+ (Challenge *)challengeWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor backgroundColor:(UIColor *)color backspacePenalty:(double)penalty;
+ (Challenge *)challengeWithText:(NSString *)text backspacePenalty:(double)penalty;

@property (nonatomic) NSString *text;
@property (nonatomic) BOOL speaksText;
@property (nonatomic) BOOL displaysText;
@property (nonatomic) UIColor *displayTextColor;
@property (nonatomic) UIColor *displayBackgroundColor;
@property (nonatomic) UIFont *displayTextFont;
@property (nonatomic) double backspacePenalty;

@end