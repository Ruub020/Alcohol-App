//
//  SettingsViewController.h
//  MID
//
//  Created by Ruben van Wezenbeek on 18/01/14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import "AppDelegate.h"
#import <iAd/iAd.h>


@interface SettingsViewController : UITableViewController <ABPeoplePickerNavigationControllerDelegate, ADBannerViewDelegate>
{
    float manvrouw2;
    __weak IBOutlet UILabel *ChosenCountryLabel;
    __weak IBOutlet UISwitch *Switch;
    
    
    IBOutlet UITableView *tableview;
    float *switchint;
    
    NSString *switchcheck;
    
    IBOutlet UILabel *tomuch;
    IBOutlet UILabel *perfect;
    
    int *tomuchint;
    int *perfectint;
    
    float test;
    
    int eenscore;
    int tweescore;
    IBOutlet UITextField *numbertextfield;
    NSString *phoneNumber;
    IBOutlet ADBannerView *BannerAd;

    
    
    __weak IBOutlet UISwitch *switchjawbone;
    int jawboneaan;
    int jawboneuit;
    UIViewController *AdmissionsViewController;
  
    
    
    
    
}
- (IBAction)didTapLogin:(UIButton *)sender;
- (IBAction)JawboneUP:(id)sender;
- (IBAction)Switch2:(id)sender;
- (IBAction)resetstats:(id)sender;
-(IBAction)yes:(id)sender;

@end
