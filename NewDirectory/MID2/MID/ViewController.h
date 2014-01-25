//
//  ViewController.h
//  MID
//
//  Created by Boike Damhuis on 17-01-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <UPPlatformSDK/UPPlatformSDK.h>


@interface ViewController : UIViewController <UIAlertViewDelegate> {
    UIViewController *firstViewController;
    NSMutableArray *array2;
    NSMutableDictionary *myDataDictionary;
    NSMutableDictionary *myDataDictionary2;
    //Input
    
    __weak IBOutlet UITextField *StandaardGlazen;
    __weak IBOutlet UITextField *AantalUren;
    //calc
    __weak IBOutlet UIButton *whereami;
    
    __weak IBOutlet UIButton *CalculateBtn;
    //output
    __weak IBOutlet UILabel *PromileLabel;
    
    int promiletest;
    
    IBOutlet UIWebView *webView;
    
    __weak IBOutlet UITextView *timeRestLabel;
    
    
    float manvrouw;
    float bestuurderfloat;
    IBOutlet UITextView *Info;
    IBOutlet UIPickerView *pick;
    
    int date;
    float GewichtFloat;
    float GlazenFloat;
    float UrenFloat;
    
    int *switchinteger;
    float test;
    
    NSString *switchstring;
    
    float *tomuchint;
    float *perfectint;
    
    
    int een;
    int twee;
    //Define The alert.
    IBOutlet UIAlertView *ReviewMe;
    
    
    
}

@property (weak, nonatomic) IBOutlet UITextView *infolabel;


@end
