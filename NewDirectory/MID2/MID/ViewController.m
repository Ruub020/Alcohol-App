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
    
    
    preciesglazen = [[NSUserDefaults standardUserDefaults] integerForKey:@"glazenprom"];
    NSLog(@"Preciesglazen is %i", preciesglazen);
    #define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
    loader.hidden=YES;
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
    
    preciesglazen = [[NSUserDefaults standardUserDefaults] integerForKey:@"glazenprom"];
    StandaardGlazen.text = [NSString stringWithFormat:@"%i", preciesglazen];
    
    NSLog(@"promileaantal == %i", array2);
    
    urlimage11 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage1"];
    urlimage22 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage2"];
    urlimage33 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage3"];
    urlimage44 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage4"];
    urlimage55 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage5"];
    urlimage66 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage6"];
    urlimage77 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage7"];
    urlimage88 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage8"];
    urlimage99 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage9"];
    urlimage00 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage0"];
    switchkey2 = [[NSUserDefaults standardUserDefaults] integerForKey:@"switchkey2"];
    NSLog(@"Test %@", urlimage22);

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
    plus = [[NSUserDefaults standardUserDefaults] integerForKey:@"plus"];
    plus2 = [[NSUserDefaults standardUserDefaults] integerForKey:@"plus2"];
    
    NSUserDefaults *promile = [NSUserDefaults standardUserDefaults];
    promileaantal = [promile floatForKey:@"PromileKey"];
    
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
    
    promileaantal2 = promileaantal;
    
    if ([StandaardGlazen.text isEqualToString:@"0"]) {
        PromileLabel.text = @"0";
        [self NiksOp];
    }
    [StandaardGlazen resignFirstResponder];
    [AantalUren resignFirstResponder];
    
    
    
    plus = 0;
    plus2 = 0;
    [self performSelector:@selector(checkpromile) withObject:nil afterDelay:0.001];
    [self performSelector:@selector(checkpromileland2) withObject:nil afterDelay:0.001];
    

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
    
    switchkey2 = [[NSUserDefaults standardUserDefaults] integerForKey:@"switchkey2"];
    if (switchkey2 == 1) {
        
    
    int randomimages = rand() % 9;
    switch (randomimages) {
        case 0:
            imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage00];

            NSLog(@"Background set");
            break;
        case 1:
            imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage11];
            NSLog(@"Background set");
            break;
        case 2:
        imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage22];
            NSLog(@"Background set");
            break;
        case 3:
         imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage33];
            NSLog(@"Background set");
            break;
        case 4:
           imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage44];
            NSLog(@"Background set");
            break;
        case 5:
imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage99];
            NSLog(@"Background set");
            break;
        case 6:
          imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage55];
            NSLog(@"Background set");
            break;
        case 7:
           imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage66];
            NSLog(@"Background set");
            break;
        case 8:
            imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage77];
            NSLog(@"Background set");
            break;
        case 9:
          imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage88];
            NSLog(@"Background set");
            break;
            
        default:
            break;
    }
        
    }

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
    
    switchkey2 = [[NSUserDefaults standardUserDefaults] integerForKey:@"switchkey2"];
    if (switchkey2 == 1) {
        
        
        int randomimages = rand() % 9;
        switch (randomimages) {
            case 0:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage00];
                
                NSLog(@"Background set");
                break;
            case 1:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage11];
                NSLog(@"Background set");
                break;
            case 2:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage22];
                NSLog(@"Background set");
                break;
            case 3:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage33];
                NSLog(@"Background set");
                break;
            case 4:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage44];
                NSLog(@"Background set");
                break;
            case 5:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage99];
                NSLog(@"Background set");
                break;
            case 6:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage55];
                NSLog(@"Background set");
                break;
            case 7:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage66];
                NSLog(@"Background set");
                break;
            case 8:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage77];
                NSLog(@"Background set");
                break;
            case 9:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage88];
                NSLog(@"Background set");
                break;
                
            default:
                break;
        }
        
    }
    
}
-(void)TeveelOp
{
 _infolabel.text = NSLocalizedString(@"Oh Oh! You had too much to drink! We strongly advise you to take a cab or let someone else drive!", @"Oh Oh! You had too much to drink! We strongly advise you to take a cab or let someone else drive!");
    
   
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
    
    switchkey2 = [[NSUserDefaults standardUserDefaults] integerForKey:@"switchkey2"];
    if (switchkey2 == 1) {
        
        
        int randomimages = rand() % 9;
        switch (randomimages) {
            case 0:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage00];
                
                NSLog(@"Background set");
                break;
            case 1:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage11];
                NSLog(@"Background set");
                break;
            case 2:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage22];
                NSLog(@"Background set");
                break;
            case 3:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage33];
                NSLog(@"Background set");
                break;
            case 4:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage44];
                NSLog(@"Background set");
                break;
            case 5:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage99];
                NSLog(@"Background set");
                break;
            case 6:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage55];
                NSLog(@"Background set");
                break;
            case 7:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage66];
                NSLog(@"Background set");
                break;
            case 8:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage77];
                NSLog(@"Background set");
                break;
            case 9:
                imageviewdelay.image = [UIImage imageWithContentsOfFile:urlimage88];
                NSLog(@"Background set");
                break;
                
            default:
                break;
        }
        
    }
    
}

-(void)awakeFromNib {
    switchkey2 = [[NSUserDefaults standardUserDefaults] integerForKey:@"switchkey2"];
}



-(void) checkpromile {
    plusfloat = UrenFloat;
    plus = plus + 1;
    GewichtFloat = [_Gewicht floatValue];
    GlazenFloat = [_StandaardGlazenString floatValue];
    UrenFloat = [_AantalurenGeleden floatValue];
    
    float test = (GlazenFloat *10) / (GewichtFloat *manvrouw) - (plus - 0.5) * (GewichtFloat *0.002);
    
    if (test < 0 | test == 0) {
        
        
        NSLog(@"Tijd is berekend, %i", plus);
        plus = plus - plusfloat;
        NSLog(@"Plus - urenfloat is %i", plus);
        [[NSUserDefaults standardUserDefaults] setInteger:plus forKey:@"plus"];
        loader.hidden=YES;
        [loader stopAnimating];
        timeRestLabel.hidden=NO;
        
        
    } else {
        [self performSelector:@selector(checkpromile2) withObject:nil afterDelay:0.01];
        NSLog(@"Tijd is niet berekend, +1 uur, %i", plus);
        [self performSelector:@selector(promiledone) withObject:nil afterDelay:0.01];
        [loader startAnimating];
        timeRestLabel.hidden=YES;
        loader.hidden=NO;
    }
    
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *oldNotifications = [app scheduledLocalNotifications];
    if ([oldNotifications count] > 0) {
        [app cancelAllLocalNotifications];
        
        
        
        
    }
}
-(void) checkpromile2 {
    plusfloat = UrenFloat;
    plus = plus + 1;
    GewichtFloat = [_Gewicht floatValue];
    GlazenFloat = [_StandaardGlazenString floatValue];
    UrenFloat = [_AantalurenGeleden floatValue];
    
    float test = (GlazenFloat *10) / (GewichtFloat *manvrouw) - (plus - 0.5) * (GewichtFloat *0.002);
    
    if (test < 0 | test == 0) {
        NSLog(@"Tijd is berekend, %i", plus);
        plus = plus - plusfloat;
        NSLog(@"Plus - urenfloat is %i", plus);
        [[NSUserDefaults standardUserDefaults] setInteger:plus forKey:@"plus"];
        [loader startAnimating];
        loader.hidden=YES;
        timeRestLabel.hidden=NO;
        
    } else {
        [self performSelector:@selector(checkpromile) withObject:nil afterDelay:0.01];
        NSLog(@"Tijd is niet berekend, +1 uur, %i", plus);
        [loader startAnimating];
        timeRestLabel.hidden=YES;
        loader.hidden=NO;
    }
    
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *oldNotifications = [app scheduledLocalNotifications];
    if ([oldNotifications count] > 0) {
        [app cancelAllLocalNotifications];
        
        
        
        
    }
}

-(void) checkpromileland {
    promile = [[NSUserDefaults standardUserDefaults] floatForKey:@"PromileKey"];
    NSLog(@"Promilaantal = %f", promile);
    plusfloat2= UrenFloat;
    plus2 = plus2 + 1;
    GewichtFloat = [_Gewicht floatValue];
    GlazenFloat = [_StandaardGlazenString floatValue];
    UrenFloat = [_AantalurenGeleden floatValue];
    
    float test = (GlazenFloat *10) / (GewichtFloat *manvrouw) - (plus2 - 0.5) * (GewichtFloat *0.002);
    
    if (test < promileaantal2| test == promileaantal2) {
        NSLog(@"_Tijd is berekend, %i", plus2);
        plus2 = plus2 - plusfloat2;
        NSLog(@"_Plus - urenfloat is %i", plus2);
        [[NSUserDefaults standardUserDefaults] setInteger:plus2 forKey:@"plus2"];
        [loader startAnimating];
        loader.hidden=YES;
        
        
        
        
    } else {
        [self performSelector:@selector(checkpromileland2) withObject:nil afterDelay:0.01];
        NSLog(@"_Tijd is niet berekend, +1 uur, %i", plus2);
        [loader startAnimating];
        timeRestLabel.hidden=YES;
        loader.hidden=NO;
    }
    
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *oldNotifications = [app scheduledLocalNotifications];
    if ([oldNotifications count] > 0) {
        [app cancelAllLocalNotifications];
        
        
        
        
    }
}
-(void) checkpromileland2 {
    promile = [[NSUserDefaults standardUserDefaults] floatForKey:@"PromileKey"];
    plusfloat2= UrenFloat;
    plus2 = plus2 + 1;
    GewichtFloat = [_Gewicht floatValue];
    GlazenFloat = [_StandaardGlazenString floatValue];
    UrenFloat = [_AantalurenGeleden floatValue];
    
    float test = (GlazenFloat *10) / (GewichtFloat *manvrouw) - (plus2 - 0.5) * (GewichtFloat *0.002);
    
    if (test < promileaantal2 | test == promileaantal2) {
        NSLog(@"_Tijd is berekend, %i", plus2);
        plus2 = plus2 - plusfloat2;
        NSLog(@"_Plus - urenfloat is %i", plus2);
        [[NSUserDefaults standardUserDefaults] setInteger:plus2 forKey:@"plus2"];
        [loader startAnimating];
        loader.hidden=YES;
        timeRestLabel.hidden=NO;
        
    } else {
        [self performSelector:@selector(checkpromileland) withObject:nil afterDelay:0.01];
        NSLog(@"_Tijd is niet berekend, +1 uur, %i", plus2);
        [loader startAnimating];
        timeRestLabel.hidden=YES;
        loader.hidden=NO;
    }
    
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *oldNotifications = [app scheduledLocalNotifications];
    if ([oldNotifications count] > 0) {
        [app cancelAllLocalNotifications];
        
        
        
        
    }
}
-(void)promiledone {
    
  

    if (plus > 0) {
        
        timeRestLabel.text = [NSString stringWithFormat:@"You are legal again in %i hours.", plus2];
        
    }
    if (plus2 > 0) {
        timeRestLabel.text = [NSString stringWithFormat:@"You are clean in %i hours. %@", plus, timeRestLabel.text];
    }
    
    
    
    
    
    if (plus < 0) {
        timeRestLabel.text = [NSString stringWithFormat:@"You are clean in %i hours. %@", plus, timeRestLabel.text];

    }
    if (plus2 < 0) {
        timeRestLabel.text = [NSString stringWithFormat:@""];

    }
 

    if (promileaantal == 0) {
        timeRestLabel.text = [NSString stringWithFormat:@"You are clean in %i hours.", plus];
    }
    
    if (plus == 0) {
        timeRestLabel.text=@"";
    }
    if (plus2 == 0) {
        timeRestLabel.text=@"";
    }

    
    
  
}



@end
