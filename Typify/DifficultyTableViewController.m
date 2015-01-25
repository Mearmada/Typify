//
//  DifficultyTableViewController.m
//  Typify
//
//  Created by Michael Somerville on 1/23/15.
//  Copyright (c) 2015 John Heaton. All rights reserved.
//

#import "DifficultyTableViewController.h"
#import "Challenge.h"
#import "ChallengeViewController.h"

@implementation DifficultyTableViewController

/*
 1. you're home (HomeViewController) with buttons for difficulties
 2. you click a button
 3. that button fires a segue with an identifier that correlates it to a difficulty
 4. the home view controller gets a chance to configure the view replacing it on screen (Difficulty table)
 5. home view looks at that identifier of the segue, says "is that shit med/hard/whatev"
 6. it gets a reference to that new difficulty table view controller from the segue (destinationViewController)
 7. hands it the challenge array for that difficulty (easyChallenges, mediumChallenges, etc.)
 8. now, difficulty table is shown on screen, and is has a valid array (challengesArray) of challenges for the level of difficulty to display
 9. load that shit in a table nigga
 
 */

- (void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.rowHeight = 80;
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.challengesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    int row = (int)indexPath.row;
    cell.textLabel.text = [NSString stringWithFormat:@"Challenge %d", row + 1];
    
    //need to fix the below code so its not a static label
    UILabel *recordLabel = [[UILabel alloc]initWithFrame:CGRectMake(230, 32, 130, 20)];
    recordLabel.textAlignment=NSTextAlignmentRight;
    
    //this needs to house the code that records the record times for each challenge instance
    
//    Challenge *mychallenge = self.challengesArray[indexPath.row];
    
    
    recordLabel.text = [NSString stringWithFormat:@"Record:"];
    recordLabel.font = [UIFont systemFontOfSize:14.0];
    UIColor * color = [UIColor colorWithRed:89/255.0f green:112/255.0f blue:127/255.0f alpha:1.0f];
    recordLabel.textColor = color;
    [cell.contentView addSubview:recordLabel];
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"startChallenge"]) {
        ChallengeViewController *vc = segue.destinationViewController;
        vc.currentChallenge = self.challengesArray[[sender row]];
        vc.challengeIndex = (int)[sender row];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"startChallenge" sender:indexPath];
}

@end
