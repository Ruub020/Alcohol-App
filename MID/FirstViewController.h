//
//  FirstViewController.h
//  MID
//
//  Created by Boike Damhuis on 18-01-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import "ViewController.h"

@interface FirstViewController : ViewController {
    
    __weak IBOutlet UILabel *label1;
    __weak IBOutlet UITextView *label2;
    __weak IBOutlet UILabel *label3;
    __weak IBOutlet UITextView *label4;
    __weak IBOutlet UITextField *label5;
    __weak IBOutlet UIButton *button;
    __weak IBOutlet UISegmentedControl *segment;
    float manvrouw2;
    
    
    

}

-(IBAction)switch:(id)sender;
-(void)check;


@end
