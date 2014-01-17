//
//  ViewController.m
//  ReviewMeFrameworks
//
//  Created by Ruben van Wezenbeek on 17/01/14.
//  Copyright (c) 2014 Ruben van Wezenbeek. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	//Call Rate
    
    //Create Message
    [self CreateMessage];
    [self Rate];
    NSUserDefaults *Defaults = [NSUserDefaults standardUserDefaults];
    NSString *CurrentLaunch = [Defaults objectForKey:@"LAUNCHNUMBER"];
    int CurrentLaunchInteger = [CurrentLaunch intValue];
    int NewLaunchInteger = CurrentLaunchInteger +1;
    NSString *NewLaunch = [NSString stringWithFormat:@"%d", NewLaunchInteger];
    [Defaults setObject:NewLaunch forKey:@"LAUNCHNUMBER"];
    [Defaults synchronize];
}

-(void)CreateMessage
{
    //Create the User Message
    REMIDER = [[UIAlertView alloc] initWithTitle:@"Rate this App" message:@"If you enjoy using this App, please take a minute to rate this App." delegate:self cancelButtonTitle:nil otherButtonTitles:@"Yes!",@"No :(", nil];
}
-(void)Rate
{    NSUserDefaults *Defaults = [NSUserDefaults standardUserDefaults];
    NSString *CurrentLaunch = [Defaults objectForKey:@"LAUNCHNUMBER"];
    int LaunchNumerInteger = [CurrentLaunch intValue];
    
    if (LaunchNumerInteger == 5) {
        [REMIDER show];
    }
    NSLog(@"%d",LaunchNumerInteger);

}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    if (buttonIndex == 0) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://itunes.apple.com/us/app/felisenum-rooster/id771022588?mt=8"]];
        NSUserDefaults *Defaults = [NSUserDefaults standardUserDefaults];
        NSString *CurrentLaunch = [Defaults objectForKey:@"LAUNCHNUMBER"];
        int CurrentLaunchInteger = [CurrentLaunch intValue];
        int NewLaunchInteger = CurrentLaunchInteger + 999999999;
        NSString *NewLaunch = [NSString stringWithFormat:@"%d", NewLaunchInteger];
        [Defaults setObject:NewLaunch forKey:@"LAUNCHNUMBER"];
        [Defaults synchronize];
    
    }
    if (buttonIndex == 1) {
        NSUserDefaults *Defaults = [NSUserDefaults standardUserDefaults];
        NSString *CurrentLaunch = [Defaults objectForKey:@"LAUNCHNUMBER"];
        int CurrentLaunchInteger = [CurrentLaunch intValue];
        int NewLaunchInteger = CurrentLaunchInteger + 999999999;
        NSString *NewLaunch = [NSString stringWithFormat:@"%d", NewLaunchInteger];
        [Defaults setObject:NewLaunch forKey:@"LAUNCHNUMBER"];
        [Defaults synchronize];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
