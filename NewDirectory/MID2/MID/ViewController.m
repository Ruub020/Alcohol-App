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
@property (weak, nonatomic) IBOutlet UIPickerView *arrayPicker;
@property (nonatomic, retain) IBOutlet NSString *Promile;
@property (nonatomic, retain) IBOutlet NSString *Bestuurder;
@property (weak, nonatomic) IBOutlet UILabel *ScoreLabel;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Init the picker view.
    pick= [[UIPickerView alloc] init];
    [pick setDataSource:self];
    [pick setDelegate:self];
	// Do any additional setup after loading the view, typically from a nib.

    /*CGFloat y = self.view.frame.size.height - 50.0;
    TFTBanner *banner = [TFTBanner bannerWithFrame: CGRectMake(0, y, 320, 50) delegate: self];
    [self.view addSubview: banner];*/
    PromileLabel.alpha = 0;
    CalculateBtn.alpha = 0;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:
                      @"landen" ofType:@"plist"];
    NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
    for (NSString *str in array2)
        NSLog(@"--%@", path);

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
    
    _Bestuurder = [[NSUserDefaults standardUserDefaults] objectForKey:@"Driver"];
    if ([_Bestuurder isEqualToString:@"0"]) {
        bestuurderfloat = 0;
    }
    if ([_Bestuurder isEqualToString:@"1"]) {
        bestuurderfloat = 1;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)ErvarenBestuurder
{
    [self DownloadGewicht];
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
            
            PromileLabel.text=@"0";
            [self NiksOp];
            [self GroeneAchtergrond];
            [self ScoreUp];
        }
        if (test > 0.1) {
            _infolabel.selectable = YES;
            NSLog(@"promile is > 0.1");
            self.view.backgroundColor = [UIColor greenColor];
            [self GemiddeldOp];
            [self GroeneAchtergrond];
            [self ScoreUp];
        }
        if (test > 0.2) {
            _infolabel.selectable = YES;
            NSLog(@"Promile is > 0.2");
            [self GemiddeldOp];
            [self GroeneAchtergrond];
            [self ScoreUp];
        }
        if (test > 0.3) {
            _infolabel.selectable = YES;
            NSLog(@"Promile is > 0.3");
            [self GemiddeldOp];
            [self GroeneAchtergrond];
            [self ScoreUp];
        }
        if (test > 0.4) {
            _infolabel.selectable = YES;
            NSLog(@"Promile is > 0.4");
            [self BijnaTeveelOp];
            [self GroeneAchtergrond];
            [self ScoreUp];
            
        }
        if (test > 0.5) {
            _infolabel.selectable = YES;
            NSLog(@"Promile is > 0.5");
            [self TeveelOp];
            [self ScoreDown];
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
            self.view.backgroundColor = Rgb2UIColor(225, 74, 74);
        }
        
        if (test > 2.0) {
            NSLog(@"Promile is > 1.0");
            [self VeelteVeelOp];
            [self ScoreDown];
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
            self.view.backgroundColor = Rgb2UIColor(225, 74, 74);
        }
        if ([_StandaardGlazenString isEqualToString:@"0"]) {
            PromileLabel.text = @"0";
        }
        
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (bestuurderfloat == 0) {
        [self BeginnendBestuurder];
    }else{
    [self ErvarenBestuurder];
    }
    [StandaardGlazen resignFirstResponder];
    [AantalUren resignFirstResponder];
}
-(void)BeginnendBestuurder
{
    
    
    //promile en country ophalen uit de andere class
    
    NSUserDefaults *promile = [NSUserDefaults standardUserDefaults];
    float promileaantal = [promile floatForKey:@"PromileKey"];
    
    [self DownloadGewicht];
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
        
        if (test < 0) {
            PromileLabel.text=@"0";
            [self NiksOp];
            [self GroeneAchtergrond];
            [self ScoreUp];
        }
        if (test == 0) {
            
            promiletest = 1;
            _infolabel.selectable = YES;
            NSLog(@"promile is < 0.1");
            
            PromileLabel.text=@"0";
            [self NiksOp];
            [self GroeneAchtergrond];
            [self ScoreUp];
        }
        if (test < promileaantal) {
            promiletest = 2;
            _infolabel.selectable = YES;
            NSLog(@"promile is > 0.1");
            self.view.backgroundColor = [UIColor greenColor];
            [self GemiddeldOp];
            [self GroeneAchtergrond];
            [self ScoreUp];
        }
        if (test > promileaantal) {
            
            promiletest = 3;
            _infolabel.selectable = YES;
            NSLog(@"Promile is > 0.2");
            [self TeveelOp];
            [self ScoreDown];

            #define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
            self.view.backgroundColor = Rgb2UIColor(225, 74, 74);
        
        if ([_StandaardGlazenString isEqualToString:@"0"]) {
            PromileLabel.text = @"0";
            
        }
            
            
        
            
            
    }
}
    
}

-(void)ScoreDown
{
    int currentscore = [_ScoreLabel.text intValue];
    int newscore = currentscore - 1;
    
    NSString *NewScoreString = [NSString stringWithFormat:@"Score: %d",newscore];
    _ScoreLabel.text = NewScoreString;
}
-(void)ScoreUp
{
    int currentscore = [_ScoreLabel.text intValue];
    int newscore = currentscore + 1;
    
    NSString *NewScoreString = [NSString stringWithFormat:@"Score: %d",newscore];
    _ScoreLabel.text = NewScoreString;
}
-(void)GroeneAchtergrond
{
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
    self.view.backgroundColor = Rgb2UIColor(125, 239, 74);
}
-(void)NiksOp
{
    _infolabel.text = NSLocalizedString(@"Well Done! Drive safely!", @"Well Done! Drive safely!");
    
    _infolabel.selectable = NO;
    

}
-(void)GemiddeldOp
{
_infolabel.text = NSLocalizedString(@"Well, You sure did drink something! Take caution, but for now you are free to drive...", @"Well, You sure did drunk something! Take caution, but for now you are free to drive...");
    
    _infolabel.selectable = NO;
    
}
-(void)TeveelOp
{
 _infolabel.text = NSLocalizedString(@"Oh Oh! You have had too much to drink! We strongly advise you to take a cab or let someone else drive!", @"Oh Oh! You have drunk too much! We strongly advise you to take a cab or let someone else drive!");
    
    _infolabel.selectable = NO;
    
}
-(void)BijnaTeveelOp
{
_infolabel.text = NSLocalizedString(@"Oeh! You almost drunk too much! Are you sure it is completely safe to drive?", @"Oeh! You almost drunk too much! Are you sure it is completely safe to drive?");
    
    _infolabel.selectable = NO;
   
}
-(void)VeelteVeelOp
{
    _infolabel.text = NSLocalizedString(@"Are you out of your mind?!", @"Are you out of your mind?!");
}
-(void)awakeFromNib {
    
    
    
}





@end
