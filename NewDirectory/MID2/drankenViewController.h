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
    
    int percentageint;
    int hoeveelint;
    
    int percentageint2;
    int hoeveelint2;
    
    int aantal;
    
    NSString *percentagestring;
    NSString *hoeveelstring;
    
    
    int total;
    IBOutlet UILabel *label;
    
    
    
    __weak IBOutlet UIButton *addbutton;
    
    __weak IBOutlet UIButton *donebutton;
    __weak IBOutlet UITextView *textfield;
    UIAlertView *alert2;
    
    
}

-(void) load;
-(void) load2;
-(void) load3;
- (IBAction)done:(id)sender;
- (IBAction)addone:(id)sender;
- (IBAction)reset:(id)sender;


@end
