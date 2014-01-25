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
    #define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

    self.view.backgroundColor = Rgb2UIColor(83, 152, 255);
    NSString *pdfPath = [[NSBundle mainBundle] pathForResource:@"d" ofType:@"pdf"];
    NSURL *url = [NSURL URLWithString:pdfPath];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    whereami.alpha = 0;
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
    
    
    twee = [[NSUserDefaults standardUserDefaults] integerForKey:@"Tomuch"];
    een = [[NSUserDefaults standardUserDefaults] integerForKey:@"Perfect"];

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
    test = [[NSUserDefaults standardUserDefaults] floatForKey:@"key"];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSUserDefaults *promile = [NSUserDefaults standardUserDefaults];
    float promileaantal = [promile floatForKey:@"PromileKey"];
    
    [self DownloadGewicht];
    [StandaardGlazen resignFirstResponder];
    [AantalUren resignFirstResponder];
    if ([StandaardGlazen.text, AantalUren.text length] > 0) {
        
        
        _StandaardGlazenString = StandaardGlazen.text;
        _AantalurenGeleden = AantalUren.text;
        
        GewichtFloat = [_Gewicht floatValue];
        GlazenFloat = [_StandaardGlazenString floatValue];
        UrenFloat = [_AantalurenGeleden floatValue];
        
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
            
            
            
            NSLog(@"TEST IS NUL");
        }
        if (test == 0) {
            
            promiletest = 1;
            _infolabel.selectable = YES;
            
            
            PromileLabel.text=@"0";
            [self NiksOp];
            [self GroeneAchtergrond];
            
            NSLog(@"TEST IS PRECIES NUL");
            
        }
        if (test < promileaantal && test > 0) {
            promiletest = 2;
            _infolabel.selectable = YES;
            
            self.view.backgroundColor = [UIColor greenColor];
            [self GemiddeldOp];
            [self GroeneAchtergrond];
            
            NSLog(@"TEST IS LAGER DAN PROMILE");
            
            
        }
        if (test > promileaantal) {
            
            promiletest = 3;
            _infolabel.selectable = YES;
            
            [self TeveelOp];
            
            NSLog(@"TEST IS HOGER DAN PROMILE");
            
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
            self.view.backgroundColor = Rgb2UIColor(225, 74, 74);
            
            if ([_StandaardGlazenString isEqualToString:@"0"]) {
                PromileLabel.text = @"0";
                
            }
            
        }
    }
    
    if ([StandaardGlazen.text isEqualToString:@"0"]) {
        PromileLabel.text = @"0";
        [self NiksOp];
    }
    [StandaardGlazen resignFirstResponder];
    [AantalUren resignFirstResponder];
    
    
    
    [self checkpromilewithtime];
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
    een = een +1;
    [[NSUserDefaults standardUserDefaults] setInteger:een forKey:@"Perfect"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(@"+1, %i", een);
    whereami.alpha = 0;

}
-(void)GemiddeldOp
{
_infolabel.text = NSLocalizedString(@"Well, You sure did drink something! Take caution, but for now you are free to drive...", @"Well, You sure did drunk something! Take caution, but for now you are free to drive...");
    
    _infolabel.selectable = NO;
    een = een +1;
    [[NSUserDefaults standardUserDefaults] setInteger:een forKey:@"Perfect"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
    NSLog(@"+1, %i", een);
    whereami.alpha = 0;
    
}
-(void)TeveelOp
{
 _infolabel.text = NSLocalizedString(@"Oh Oh! You have had too much to drink! We strongly advise you to take a cab or let someone else drive!", @"Oh Oh! You have drunk too much! We strongly advise you to take a cab or let someone else drive!");
    
   
    _infolabel.selectable = NO;
    
    whereami.alpha = .7;
    
    if (test == 1) {
        NSLog(@"VIBRATE");
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    twee = twee +1;
    [[NSUserDefaults standardUserDefaults] setInteger:twee forKey:@"Tomuch"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(@"+1 %i", twee);
    
}

-(void)awakeFromNib {
}
-(void)checkpromilewithtime {
    if ([StandaardGlazen.text isEqualToString:@"1"]) {
        date = 2;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
        
        
        
    } else {
        timeRestLabel.text = [NSString stringWithFormat:@"We can't calculate your time..."];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"2"]) {
        date = 4;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"3"]) {
        date = 6;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"4"]) {
        date = 8;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"5"]) {
        date = 9;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"6"]) {
        date = 11;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"7"]) {
        date = 13;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"8"]) {
        date = 14;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"9"]) {
        date = 16;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"10"]) {
        date = 18;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"11"]) {
        date = 19;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"12"]) {
        date = 21;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"13"]) {
        date = 23;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"14"]) {
        date = 24;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"15"]) {
        date = 26;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"16"]) {
        date = 27;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"17"]) {
        date = 29;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"18"]) {
        date = 31;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"19"]) {
        date = 33;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    if ([StandaardGlazen.text isEqualToString:@"20"]) {
        date = 35;
        date = date - UrenFloat;
        timeRestLabel.text= [NSString stringWithFormat:@"Your BAC is out of your blood in %i hours!", date];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    
    if (date < 1) {
        timeRestLabel.text = [NSString stringWithFormat:@""];
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *oldNotifications = [app scheduledLocalNotifications];
        if ([oldNotifications count] > 0) {
            [app cancelAllLocalNotifications];
        }
    }
    
    [[NSUserDefaults standardUserDefaults] setInteger:date forKey:@"date"];

}

-(void) checkpromile {
    
    plus = plus + 1;
    GewichtFloat = [_Gewicht floatValue];
    GlazenFloat = [_StandaardGlazenString floatValue];
    UrenFloat = [_AantalurenGeleden floatValue];
    
    float test = (GlazenFloat *10) / (GewichtFloat *manvrouw) - (UrenFloat - 0.5) * (GewichtFloat *0.002);
    
    
}




@end
