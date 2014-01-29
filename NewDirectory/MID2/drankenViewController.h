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
    
    
    
    
    
}

-(void) load;
-(void) load2;
- (IBAction)done:(id)sender;
- (IBAction)addone:(id)sender;


@end
