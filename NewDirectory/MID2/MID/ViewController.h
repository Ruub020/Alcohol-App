//
//  ViewController.h
//  MID
//
//  Created by Boike Damhuis on 17-01-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    UIViewController *firstViewController;
    NSMutableArray *array2;
    NSMutableDictionary *myDataDictionary;
    NSMutableDictionary *myDataDictionary2;
    //Input
    
    __weak IBOutlet UITextField *StandaardGlazen;
    __weak IBOutlet UITextField *AantalUren;
    //calc
    
    __weak IBOutlet UIButton *CalculateBtn;
    //output
    __weak IBOutlet UILabel *PromileLabel;
    
    int promiletest;
    
    
    float manvrouw;
    float bestuurderfloat;
    IBOutlet UITextView *Info;
    IBOutlet UIPickerView *pick;
    
    
    
    
}

@property (weak, nonatomic) IBOutlet UITextView *infolabel;


@end
