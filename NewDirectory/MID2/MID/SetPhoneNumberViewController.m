//
//  SetPhoneNumberViewController.m
//  MID
//
//  Created by Ruben van Wezenbeek on 21/01/14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import "SetPhoneNumberViewController.h"

@interface SetPhoneNumberViewController ()

@end

@implementation SetPhoneNumberViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)Contacts:(id)sender {
    ABPeoplePickerNavigationController *picker =
    [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
}
- (void)peoplePickerNavigationControllerDidCancel:
(ABPeoplePickerNavigationController *)peoplePicker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person {
    
    [self displayPerson:person];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    return NO;
}
- (void)displayPerson:(ABRecordRef)person
{
    NSString* phone = nil;
    ABMultiValueRef phoneNumbers = ABRecordCopyValue(person,
                                                     kABPersonPhoneProperty);
    if (ABMultiValueGetCount(phoneNumbers) > 0) {
        phone = (__bridge_transfer NSString*)
        ABMultiValueCopyValueAtIndex(phoneNumbers, 0);
    } else {
        phone = @"[None]";
    }
    [[NSUserDefaults standardUserDefaults] setObject:phone forKey:@"NUMBER"];
    PhoneNumber.text = phone;
}

- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                              identifier:(ABMultiValueIdentifier)identifier
{
    return NO;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
- (IBAction)Next:(id)sender {
    NSString *Number = PhoneNumber.text;
    [[NSUserDefaults standardUserDefaults] setObject:Number forKey:@"NUMBER"];
    [PhoneNumber resignFirstResponder];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"root3"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"root4"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}
@end
