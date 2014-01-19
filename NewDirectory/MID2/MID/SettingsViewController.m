//
//  SettingsViewController.m
//  MID
//
//  Created by Ruben van Wezenbeek on 18/01/14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *WeightField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment;
@property (strong, nonatomic) IBOutlet NSString *MenWomen;
@property (weak, nonatomic) IBOutlet UISegmentedControl *DriverSegment;
@property (nonatomic, retain) IBOutlet NSString *Bestuurder;

@end

@implementation SettingsViewController
@synthesize segment;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    NSUserDefaults *Defaults = [NSUserDefaults standardUserDefaults];
    NSString *Currentweight = [Defaults objectForKey:@"Weight"];
    _WeightField.text = Currentweight;
    [self SetSegentVoid];
    [super viewDidLoad];

//Add a Bar ontop of the Textfield
    UIToolbar* SaveWeight = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    SaveWeight.barStyle = UIBarStyleBlackTranslucent;
    SaveWeight.items = [NSArray arrayWithObjects:
                    [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(SaveWeight)],
                       [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                       [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(ResignTextfield)],
                       nil];
    [SaveWeight sizeToFit];
    _WeightField.inputAccessoryView = SaveWeight;

    manvrouw2 = [[NSUserDefaults standardUserDefaults] floatForKey:@"keyfloat"];
    [self DownloadDriver];
    [NSTimer scheduledTimerWithTimeInterval:0.1
                                     target:self
                                   selector:@selector(DownloadCountry)
                                   userInfo:nil
                                    repeats:YES];
    

}
-(void)DownloadCountry
{
    NSString *Country = [[NSUserDefaults standardUserDefaults] objectForKey:@"COUNTRY"];
    NSString *Prommilage = [[NSUserDefaults standardUserDefaults] objectForKey:@"PROMMILAGE"];
    NSString *CellText = [NSString stringWithFormat:@"%@%@%@",Country , @" - ", Prommilage];
    
    
    ChosenCountryLabel.text = CellText;
    
}
-(void)DownloadDriver
{
    _Bestuurder = [[NSUserDefaults standardUserDefaults] objectForKey:@"Driver"];

    if ([_Bestuurder isEqualToString:@"0"]) {
        _DriverSegment.selectedSegmentIndex = 0;
    }else{
        _DriverSegment.selectedSegmentIndex = 1;
    }
}
- (IBAction)DriverClicked:(id)sender {
        NSString *BestuurderString;
        if (_DriverSegment.selectedSegmentIndex == 0) {
            BestuurderString = @"0";
        }
        if (_DriverSegment.selectedSegmentIndex == 1) {
            BestuurderString = @"1";
        }
        [[NSUserDefaults standardUserDefaults]setObject:BestuurderString forKey:@"Driver"];
}

-(void)SetSegentVoid
{
    _MenWomen = [[NSUserDefaults standardUserDefaults] objectForKey:@"MenWomen"];
    
    if ([_MenWomen isEqualToString:@"MAN"]) {
        segment.selectedSegmentIndex = 0;
    }else{
        segment.selectedSegmentIndex = 1;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)ResignTextfield
{
    [_WeightField resignFirstResponder];
}
-(void)SaveWeight
{
    NSUserDefaults *Prefs = [NSUserDefaults standardUserDefaults];
    //Gewicht
    NSString *Weight = _WeightField.text;
    //Sla gewicht op
    [Prefs setObject:Weight forKey:@"Weight"];
    [Prefs synchronize];
    [_WeightField resignFirstResponder];
}


- (IBAction)Switch:(id)sender {
    [self CheckMenOrWomen];
}

-(void)CheckMenOrWomen
{
    switch (segment.selectedSegmentIndex) {
        case 0:
            manvrouw2 = 0.72;
            _MenWomen = @"MAN";
            NSLog(@"Manvrouw is 0.72");
            [self performSelector:@selector(Check) withObject:self];
            

            break;
        case 1:
            manvrouw2 = 0.61;
            NSLog(@"Manvrouw is 0.61");
            _MenWomen = @"WOMEN";
                        [self performSelector:@selector(Check) withObject:self];
            
            break;
        default:
            break;
            
    }


}
-(void)Check
{
    [[NSUserDefaults standardUserDefaults] setFloat:manvrouw2 forKey:@"keyfloat"];

        [[NSUserDefaults standardUserDefaults] setObject:_MenWomen forKey:@"MenWomen"];
}

@end
