//
//  ViewController.m
//  MID
//
//  Created by Boike Damhuis on 17-01-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import "ViewController.h"
#import "TFTTapForTap.h"

@interface ViewController ()
@property (nonatomic, retain) IBOutlet NSString *Gewicht;
@property (nonatomic, retain) IBOutlet NSString *StandaardGlazenString;
@property (nonatomic, retain) IBOutlet NSString *AantalurenGeleden;
@property (nonatomic, retain) IBOutlet NSString *Promile;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    /*CGFloat y = self.view.frame.size.height - 50.0;
    TFTBanner *banner = [TFTBanner bannerWithFrame: CGRectMake(0, y, 320, 50) delegate: self];
    [self.view addSubview: banner];*/
    

//Download het gewicht
    [self DownloadGewicht];
}
-(void)DownloadGewicht
{
    NSUserDefaults *Prefs = [NSUserDefaults standardUserDefaults];
    //Vul string met gewicht data
    _Gewicht= [Prefs objectForKey:@"Weight"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CalculatePressed:(id)sender {
    [StandaardGlazen resignFirstResponder];
    [AantalUren resignFirstResponder];
    _StandaardGlazenString = StandaardGlazen.text;
    _AantalurenGeleden = AantalUren.text;
    
    float GewichtFloat = [_Gewicht floatValue];
    float GlazenFloat = [_StandaardGlazenString floatValue];
    float UrenFloat = [_AantalurenGeleden floatValue];
    
    float test = (GlazenFloat *10) / (GewichtFloat *0.72) - (UrenFloat - 0.5) * (GewichtFloat *0.002);
    
    
    NSString *PromileString = [NSString stringWithFormat:@"%f",test];
    _Promile = PromileString;
    
    PromileLabel.text = _Promile;
    
}
@end
