//
//  SettingsViewController.m
//  MID
//
//  Created by Ruben van Wezenbeek on 18/01/14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import "SettingsViewController.h"



#define kRemoveAdsProductIdentifier @"001";

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

- (IBAction)OpenContacts:(id)sender {
    ABPeoplePickerNavigationController *picker =
    [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
    
    
}
- (void)peoplePickerNavigationControllerDidCancel:
(ABPeoplePickerNavigationController *)peoplePicker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person {
    
    [self displayPerson:person];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    return NO;
}
- (void)displayPerson:(ABRecordRef)person
{
    NSString* phone = nil;
    ABMultiValueRef phoneNumbers = ABRecordCopyValue(person,
                                                     kABPersonPhoneProperty);
    if (ABMultiValueGetCount(phoneNumbers) > 0) {
        phone = (__bridge_transfer NSString*)
        ABMultiValueCopyValueAtIndex(phoneNumbers, 0);
    } else {
        phone = @"[None]";
    }
    [[NSUserDefaults standardUserDefaults] setObject:phone forKey:@"NUMBER"];
    [self viewDidLoad];
}

- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                              identifier:(ABMultiValueIdentifier)identifier
{
    return NO;
}
- (void)viewDidLoad
{
    ads = [[NSUserDefaults standardUserDefaults] boolForKey:@"ads"];
   /* areAdsRemoved = [[NSUserDefaults standardUserDefaults] boolForKey:@"areAddsRemoved"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    //this will load wether or not they bought the in-app purchase
    
    if(areAdsRemoved){
        [self.view setBackgroundColor:[UIColor blueColor]];
        //if they did buy it, set the background to blue, if your using the code above to set the background to blue, if your removing ads, your going to have to make your own code here
    }*/
    
    BannerAd.delegate = self;


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
    
    
    test = [[NSUserDefaults standardUserDefaults] floatForKey:@"key"];
    jawboneaan = [[NSUserDefaults standardUserDefaults] integerForKey:@"aan"];
    jawboneuit = [[NSUserDefaults standardUserDefaults] integerForKey:@"uit"];
    if (test == 1) {
        [Switch setOn:YES animated:NO];
        NSLog(@"Switch goes on");
        
    }
    if (test == 2) {
        [Switch setOn:NO animated:NO];
        
        NSLog(@"Switch goes off");
    }
    
    
    
    eenscore = [[NSUserDefaults standardUserDefaults] integerForKey:@"Tomuch"];
    tweescore = [[NSUserDefaults standardUserDefaults] integerForKey:@"Perfect"];
    NSLog(@"%i", eenscore);
    NSLog(@"%i", tweescore);

    
    tomuch.text = [NSString stringWithFormat:@"%i", eenscore];
    perfect.text = [NSString stringWithFormat:@"%i", tweescore];
    
    //Add a Bar ontop of the Textfield
    UIToolbar* SaveNumber = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    SaveNumber.barStyle = UIBarStyleBlackTranslucent;
    SaveNumber.items = [NSArray arrayWithObjects:
                        [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(SaveNumber)],
                        [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                        [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(ResignTextfield)],
                        nil];
    [SaveNumber sizeToFit];
    numbertextfield.inputAccessoryView = SaveNumber;
    
    
    
    phoneNumber = [[NSUserDefaults standardUserDefaults]objectForKey:@"NUMBER"];
    NSLog(@"%@", phoneNumber);
    
    numbertextfield.text = [NSString stringWithFormat:@"%@",phoneNumber];
    
    
    
    if (jawboneaan == 1) {
        [switchjawbone setOn:NO animated:NO];
    }
    if (jawboneaan == 2) {
        [switchjawbone setOn:YES animated:NO];
    }
    
    
    
    
    

   

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
    [numbertextfield resignFirstResponder];
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
-(void)SaveNumber{
    phoneNumber = [numbertextfield text];
    [[NSUserDefaults standardUserDefaults] setObject:phoneNumber forKey:@"NUMBER"];
    
    
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    NSLog(@"phonenumer: %@", phoneNumber);
    [numbertextfield resignFirstResponder];

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
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    

}


-(void)awakeFromNib {
    
    test = [[NSUserDefaults standardUserDefaults] floatForKey:@"key"];
    jawboneaan = [[NSUserDefaults standardUserDefaults] integerForKey:@"aan"];
    jawboneuit = [[NSUserDefaults standardUserDefaults] integerForKey:@"uit"];
    if (test == 1) {
        [Switch setOn:YES animated:NO];
        NSLog(@"Switch goes on");
        
    }
    if (test == 2) {
        [Switch setOn:NO animated:NO];
        
        NSLog(@"Switch goes off");
    }
    
    if (jawboneaan == 1) {
        [switchjawbone setOn:NO animated:NO];
    }
    if (jawboneaan == 2) {
        [switchjawbone setOn:YES animated:NO];
    }




}

- (IBAction)JawboneUP:(id)sender {
    if (!(switchjawbone.isOn)) {
        NSLog(@"Jawbone switch is uit");
        jawboneaan = 1;
        [[NSUserDefaults standardUserDefaults] setFloat:jawboneaan forKey:@"aan"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    if (switchjawbone.isOn) {
        NSLog(@"Jawbone switch is aan");
        jawboneaan = 2;
        [[NSUserDefaults standardUserDefaults] setFloat:jawboneaan forKey:@"aan"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
    }
}

- (IBAction)Switch2:(id)sender {
    
    
    if (!(Switch.isOn)) {
        NSLog(@"Switch is off");
        
        test = 2;
        
        
        
        [[NSUserDefaults standardUserDefaults] setFloat:test forKey:@"key"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSLog(@"Float is %f 1", test);
        
        
        
        
        
    }
    if (Switch.isOn) {
        NSLog(@"Switch is on");
        
        test = 1;
        
        
        
        
        
        [[NSUserDefaults standardUserDefaults] setFloat:test forKey:@"key"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSLog(@"Float is %f 2", test);

        
        
        
    }
    
}
-(IBAction)resetstats:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Sure?"
                          message:@"Are you sure want to reset all the data?"
                          delegate:self
                          cancelButtonTitle:@"No"
                          otherButtonTitles:@"Yes", nil];
    [alert show];
    
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        eenscore = 0;
        tweescore = 0;
        
        NSLog(@"%i", eenscore);
        NSLog(@"%i", tweescore);
        
        
        tomuch.text = [NSString stringWithFormat:@"%i", eenscore];
        perfect.text = [NSString stringWithFormat:@"%i", tweescore];
        
        [[NSUserDefaults standardUserDefaults] setInteger:eenscore forKey:@"Tomuch"];
        [[NSUserDefaults standardUserDefaults] setInteger:tweescore forKey:@"Perfect"];
        [[NSUserDefaults standardUserDefaults] synchronize];

       
    }
   }

-(IBAction)yes:(id)sender {
    
    phoneNumber = [[NSUserDefaults standardUserDefaults]objectForKey:@"NUMBER"];
    NSLog(@"%@", phoneNumber);
    
    numbertextfield.text = [NSString stringWithFormat:@"%@",phoneNumber];
    
}



- (IBAction)SwitchView:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    UIViewController* initialHelpView = [storyboard instantiateInitialViewController];
    
    initialHelpView.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentModalViewController:initialHelpView animated:YES];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
  
    NSLog(@"%@", error);
    [banner setHidden:YES];
     tableview.tableHeaderView = nil;

}
-(void)bannerViewWillLoadAd:(ADBannerView *)banner
{
    if (ads == YES) {
        [banner setHidden:YES];
        tableview.tableHeaderView = nil;
    } else {
       [banner setHidden:NO];
    }
   
   
}


@end
