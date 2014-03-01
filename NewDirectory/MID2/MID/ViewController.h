//
//  ViewController.h
//  MID
//
//  Created by Boike Damhuis on 17-01-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "ACAttitude.h"
#import <QuartzCore/QuartzCore.h>
#import <iAd/iAd.h>


@class ACParallaxView;
@protocol ACParallaxViewDelegate <NSObject>
@optional
- (void)parallaxViewWillBeginParallax:(ACParallaxView*)parallaxView;
- (void)parallaxViewDidBeginParallax:(ACParallaxView*)parallaxView;
- (void)parallaxViewWillEndParallax:(ACParallaxView*)parallaxView;
- (void)parallaxViewDidEndParallax:(ACParallaxView*)parallaxView;
- (void)parallaxView:(ACParallaxView*)parallaxView didChangeRelativeAttitude:(ACAttitude)attitude;
@end

@interface ViewController : UIViewController <UIAlertViewDelegate, ADBannerViewDelegate> {
    UIViewController *firstViewController;
    NSMutableArray *array2;
    NSMutableDictionary *myDataDictionary;
    NSMutableDictionary *myDataDictionary2;
    //Input
    __weak IBOutlet UIActivityIndicatorView *loader;
    
    __weak IBOutlet UIButton *greenred;
    __weak IBOutlet UITextField *StandaardGlazen;
    __weak IBOutlet UITextField *AantalUren;
    //calc
    __weak IBOutlet UIButton *whereami;
    
    __weak IBOutlet UIButton *CalculateBtn;
    //output
    __weak IBOutlet UILabel *PromileLabel;
    IBOutlet ADBannerView *BannerAd;
    
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
    
    BOOL ads;
    __weak IBOutlet UIImageView *imageviewdelay;
    int *switchinteger;
    float test;
    
    NSString *switchstring;
    
    float *tomuchint;
    float *perfectint;
    
    
    float preciesglazen;
    
    
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
@property (nonatomic, weak) id<ACParallaxViewDelegate> parallaxDelegate;
@property (nonatomic, assign, getter = isParallax) BOOL parallax;
@property (nonatomic, assign) BOOL refocusParallax;

@property (nonatomic, strong, readonly) CMMotionManager *sharedMotionManager;
@property (nonatomic, assign) ACAttitude referenceAttitude;
@property (nonatomic, assign, readonly) ACAttitude relativeAttitude;

@property (weak, nonatomic) IBOutlet UITextView *infolabel;


@end
