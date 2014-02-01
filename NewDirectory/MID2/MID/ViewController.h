//
//  ViewController.h
//  MID
//
//  Created by Boike Damhuis on 17-01-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>



@interface ViewController : UIViewController <UIAlertViewDelegate> {
    UIViewController *firstViewController;
    NSMutableArray *array2;
    NSMutableDictionary *myDataDictionary;
    NSMutableDictionary *myDataDictionary2;
    //Input
    __weak IBOutlet UIActivityIndicatorView *loader;
    
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
    float promileaantal;
    
    float manvrouw;
    float bestuurderfloat;
    IBOutlet UITextView *Info;
    IBOutlet UIPickerView *pick;
    float promileaantal2;
    int date;
    int date2;
    
    int switchkey2;
    float promile;
    
    float GewichtFloat;
    float GlazenFloat;
    float UrenFloat;
    
    int plus;
    int plusfloat;
    
    int plus2;
    int plusfloat2;
    
    
    __weak IBOutlet UIImageView *imageviewdelay;
    int *switchinteger;
    float test;
    
    NSString *switchstring;
    
    float *tomuchint;
    float *perfectint;
    
    
    int preciesglazen;
    
    
    int een;
    int twee;
    //Define The alert.
    IBOutlet UIAlertView *ReviewMe;
    
    

    NSString *urlimage11;

    NSString *urlimage22;
    NSString *urlimage33;
    NSString *urlimage44;
    NSString *urlimage55;
    NSString *urlimage66;
    NSString *urlimage77;
    NSString *urlimage88;
    NSString *urlimage99;
    NSString *urlimage00;
    
    
    
}

@property (weak, nonatomic) IBOutlet UITextView *infolabel;


@end
