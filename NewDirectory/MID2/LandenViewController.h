//
//  LandenViewController.h
//  MID
//
//  Created by Boike Damhuis on 19-01-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LandenViewController : UITableViewController {
    float country;
    float promile;
    UIAlertView *Chosen;
    
}
@property (strong, nonatomic) NSArray *content;

@end
