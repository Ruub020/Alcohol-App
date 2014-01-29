//
//  drankenViewController.m
//  MID
//
//  Created by Boike Damhuis on 29-01-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import "drankenViewController.h"

@interface drankenViewController ()

@end

@implementation drankenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}



//Write to the plist



//Read from the plist


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)awakeFromNib {
    percentageint  = 0;
    hoeveelint = 0;
    aantal = 0;
    [[NSUserDefaults standardUserDefaults] setInteger:hoeveelint forKey:[NSString stringWithFormat:@"hoeveel%i", aantal]];
    
}
- (IBAction)done:(id)sender {
    
    
}

- (IBAction)addone:(id)sender {
    aantal = aantal + 1;
    
    percentagestring = percentage.text;
    hoeveelstring = hoeveel.text;
    
    hoeveelint = [[hoeveel text] intValue];
    
    percentageint = [[percentage text] intValue];
    percentageint2 = percentageint / 5;
    
    hoeveelint = hoeveelint * percentageint2;
    NSLog(@"Percentageint 2 is: %i", hoeveelint);

    [[NSUserDefaults standardUserDefaults] setInteger:hoeveelint forKey:@"hoeveelint"];
    
    
    percentage.text = @"";
    hoeveel.text = @"";
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Drink added"
                          message:[NSString stringWithFormat:@"Added %i glasses.", hoeveelint]
                          delegate:nil
                          cancelButtonTitle:@"Dismiss"
                          otherButtonTitles:nil];
    [alert show];
    
    
    
}
@end
