//
//  ContactViewController.m
//  MID
//
//  Created by Ruben van Wezenbeek on 21/01/14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()
{
    SLComposeViewController *Tweet;
}

@end

@implementation ContactViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    Tweet = [[SLComposeViewController alloc] init];
    Composer = [[MFMailComposeViewController alloc] init];
    
}
- (IBAction)MailUsClicked:(id)sender {
    [self SendMail];
}
- (IBAction)TweetUsClicked:(id)sender {
    [self SendTweet];
}
- (IBAction)FollowUsOnTwitter:(id)sender
{
    NSURL *Url = [NSURL URLWithString:@"https://twitter.com/TheMIDapp"];
    [[UIApplication sharedApplication] openURL:Url];
}
-(void)SendTweet
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        Tweet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [Tweet setInitialText:@"@TheMIDapp"];
        [self presentViewController:Tweet animated:YES completion:nil];
    }else{
        UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"ERROR" message:@"You are not able to tweet at this time!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:  nil];
        [Error show];
    }
}
-(void)SendMail
{
    Composer.mailComposeDelegate = self;

    [Composer setSubject:@"MID App"];
    [Composer setMessageBody:nil isHTML:noErr];
    [Composer setToRecipients:[NSArray arrayWithObjects:@"boike.damhuis@me.com", @"ruben.vanwezenbeek@hotmail.com", nil]];
    // Present mail view controller on screen
    [self presentViewController:Composer animated:YES completion:NULL];
}
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
     [self dismissViewControllerAnimated:YES completion:NULL];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
