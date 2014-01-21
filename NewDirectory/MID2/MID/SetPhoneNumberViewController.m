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
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"root2"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"root1"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}
@end
