//
//  SettingsViewController.h
//  MID
//
//  Created by Ruben van Wezenbeek on 18/01/14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UITableViewController
{
    float manvrouw2;
    __weak IBOutlet UILabel *ChosenCountryLabel;
    __weak IBOutlet UISwitch *Switch;
    
    
    float *switchint;
    
    NSString *switchcheck;
    
    IBOutlet UILabel *tomuch;
    IBOutlet UILabel *perfect;
    
    int *tomuchint;
    int *perfectint;
    
    float test;
    
    int eenscore;
    int tweescore;
    
    
    
    
}
- (IBAction)Switch2:(id)sender;
- (IBAction)resetstats:(id)sender;

@end
