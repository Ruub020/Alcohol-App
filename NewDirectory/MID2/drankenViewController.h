//
//  drankenViewController.h
//  MID
//
//  Created by Boike Damhuis on 29-01-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import "ViewController.h"

@interface drankenViewController : ViewController

{
    NSArray *myarray;
    __weak IBOutlet UITextField *percentage;
    __weak IBOutlet UITextField *hoeveel;
    
    float percentageint;
    float hoeveelint;
    
    float percentageint2;
    float hoeveelint2;
    
    float aantal;
    
    NSString *percentagestring;
    NSString *hoeveelstring;
    
    float glasses;
    
    __weak IBOutlet UIButton *add;
    int total;
    IBOutlet UILabel *label;
    
    float milliliters;
    
    
    __weak IBOutlet UISegmentedControl *segmentmilli;
    float percentagefloat;
    __weak IBOutlet UIButton *addbutton;
    
    __weak IBOutlet UIButton *donebutton;
    __weak IBOutlet UITextView *textfield;
    UIAlertView *alert2;
    
    __weak IBOutlet UIButton *reset;
    
}

-(void) load;
-(void) load2;
-(void) load3;
- (IBAction)done:(id)sender;
- (IBAction)addone:(id)sender;
- (IBAction)reset:(id)sender;
- (IBAction)SegmentMilliliters:(id)sender;


@end
