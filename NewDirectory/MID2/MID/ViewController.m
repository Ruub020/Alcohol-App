//
//  ViewController.m
//  MID
//
//  Created by Boike Damhuis on 17-01-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import "ViewController.h"


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
    PromileLabel.alpha = 0;
    CalculateBtn.alpha = 0;
    

//Download het gewicht
    [self DownloadGewicht];
}
-(void)DownloadGewicht
{
    NSUserDefaults *Prefs = [NSUserDefaults standardUserDefaults];
    //Vul string met gewicht data
    _Gewicht= [Prefs objectForKey:@"Weight"];
    manvrouw = [[NSUserDefaults standardUserDefaults] floatForKey:@"keyfloat"];
    NSLog(@"%f", manvrouw);
    NSLog(@"Manvrouw");
    
 

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [StandaardGlazen resignFirstResponder];
    [AantalUren resignFirstResponder];
    if ([StandaardGlazen.text, AantalUren.text length] > 0) {
       
       
        _StandaardGlazenString = StandaardGlazen.text;
        _AantalurenGeleden = AantalUren.text;
        
        float GewichtFloat = [_Gewicht floatValue];
        float GlazenFloat = [_StandaardGlazenString floatValue];
        float UrenFloat = [_AantalurenGeleden floatValue];
        
        float test = (GlazenFloat *10) / (GewichtFloat *manvrouw) - (UrenFloat - 0.5) * (GewichtFloat *0.002);
        
        
        NSString *PromileString = [NSString stringWithFormat:@"%f",test];
        _Promile = PromileString;
        
        NSRange stringRange = {0, MIN([_Promile length], 4)};
        stringRange = [_Promile rangeOfComposedCharacterSequencesForRange:stringRange];
        NSString *shortString = [_Promile substringWithRange:stringRange];
        
        PromileLabel.text = shortString;
        
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        [PromileLabel setAlpha:1];
        [UIView commitAnimations];
        
        
        if (test < 0.1) {
            _infolabel.selectable = YES;
            NSLog(@"promile is > 0.1");
            self.view.backgroundColor = [UIColor greenColor];
            PromileLabel.text=@"0";
            [self NiksOp];
        }
        if (test > 0.1) {
            _infolabel.selectable = YES;
            NSLog(@"promile is > 0.1");
            self.view.backgroundColor = [UIColor greenColor];
            [self GemiddeldOp];
        }
        if (test > 0.2) {
            _infolabel.selectable = YES;
            NSLog(@"Promile is > 0.2");
            [self GemiddeldOp];
        }
        if (test > 0.3) {
            _infolabel.selectable = YES;
            NSLog(@"Promile is > 0.3");
            [self GemiddeldOp];
        }
        if (test > 0.4) {
            _infolabel.selectable = YES;
            NSLog(@"Promile is > 0.4");
            [self BijnaTeveelOp];

        }
        if (test > 0.5) {
            _infolabel.selectable = YES;
            NSLog(@"Promile is > 0.5");
            [self TeveelOp];
            self.view.backgroundColor = [UIColor redColor];
        }
        
       
        if ([_StandaardGlazenString isEqualToString:@"0"]) {
            PromileLabel.text = @"0";
        }

        
        
    }
}

-(void)NiksOp
{
    _infolabel.text = @"Well Done! Drive safely!";
    
    _infolabel.selectable = NO;
    

}
-(void)GemiddeldOp
{
    _infolabel.text = @"Well, You sure did drunk something! Take caution, but for now you are free to drive...";
    
    _infolabel.selectable = NO;
    
}
-(void)TeveelOp
{
    _infolabel.text = @"Oh Oh! You have drunk too much! We strongly advise you to take a cab or let someone else drive!";
    
    _infolabel.selectable = NO;
    
}
-(void)BijnaTeveelOp
{
    _infolabel.text = @"Oeh! You almost drunk too much! Are you sure it is completely safe to drive?";
    
    _infolabel.selectable = NO;
   
}

@end
