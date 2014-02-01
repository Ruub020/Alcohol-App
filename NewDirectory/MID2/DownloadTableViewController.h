//
//  DownloadTableViewController.h
//  MID
//
//  Created by Boike Damhuis on 01-02-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownloadTableViewController : UITableViewController {
    int count;
    NSString *url;
    NSString *urlimage;
    NSString *urlimage1;
    NSString *urlimage2;
    NSString *urlimage3;
    NSString *urlimage4;
    NSString *urlimage5;
    NSString *urlimage6;
    NSString *urlimage7;
    NSString *urlimage8;
    NSString *urlimage9;
    NSString *urlimage0;
    int switch2;
    int progress;
    __weak IBOutlet UILabel *status;
    __weak IBOutlet UIButton *button;
}
@property (weak, nonatomic) IBOutlet UISwitch *switch2;
- (IBAction)switch2:(id)sender;
@property(nonatomic, strong) NSMutableData *imageData;
@property(nonatomic, assign) float length;
@property(nonatomic, strong) IBOutlet UIProgressView *progressView;
@property(nonatomic, strong) IBOutlet UIImageView *imageView;
@property(nonatomic, strong) IBOutlet UILabel *timeLabel;
- (void)saveLocally:(NSData *)imgData;

-(IBAction)download:(id)sender;
-(IBAction)set:(id)sender;
@end


