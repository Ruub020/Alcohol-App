//
//  SetPhoneNumberViewController.h
//  MID
//
//  Created by Ruben van Wezenbeek on 21/01/14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>

@interface SetPhoneNumberViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate>
{
    
    __weak IBOutlet UITextField *PhoneNumber;
}
- (IBAction)Next:(id)sender;

@end
