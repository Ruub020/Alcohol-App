//
//  ViewController.h
//  ReviewMeFrameworks
//
//  Created by Ruben van Wezenbeek on 17/01/14.
//  Copyright (c) 2014 Ruben van Wezenbeek. All rights reserved.
//

#import <UIKit/UIKit.h>

//You need a UIAlertViewDelegate
@interface ViewController : UIViewController <UIAlertViewDelegate>
{
    //Define the alert.
    IBOutlet UIAlertView *REMIDER;
}

@end
