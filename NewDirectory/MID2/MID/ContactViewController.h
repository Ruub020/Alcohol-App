//
//  ContactViewController.h
//  MID
//
//  Created by Ruben van Wezenbeek on 21/01/14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <MessageUI/MessageUI.h>

@interface ContactViewController : UITableViewController <MFMailComposeViewControllerDelegate>
{
    MFMailComposeViewController *Composer;
}

@end
