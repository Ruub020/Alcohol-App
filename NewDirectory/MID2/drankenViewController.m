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
    
    textfield.editable = NO;
    textfield.selectable = NO;

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
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];

    
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"Edit started");
    donebutton.hidden = YES;
    addbutton.hidden =NO;
    return YES;
}

- (IBAction)addone:(id)sender {
    [self performSelector:@selector(load) withObject:nil afterDelay:0.2];
    textfield.editable = YES;
    textfield.selectable = YES;
    [self.view endEditing:YES];
   }

- (IBAction)reset:(id)sender {
    total = 0;

    hoeveel.text = @"";
    aantal = 0;
    hoeveelint = 0;
    percentageint2 = 0;
    textfield.text = @"Glasses: 0.00";
    reset.hidden=YES;

}

- (IBAction)SegmentMilliliters:(id)sender {
    add.enabled = YES;
    if (segmentmilli.selectedSegmentIndex == 0) {
        milliliters = 5;
        percentage.text = @"5";
        NSLog(@"Select");
    }
    if (segmentmilli.selectedSegmentIndex == 1) {
        milliliters = 7;
        percentage.text = @"7";
        NSLog(@"Select");
    }
    if (segmentmilli.selectedSegmentIndex == 2) {
        milliliters = 12;
        percentage.text = @"12";
        NSLog(@"Select");
    }
    if (segmentmilli.selectedSegmentIndex == 3) {
        milliliters = 17;
        percentage.text = @"17";
        NSLog(@"Select");
    }
    if (segmentmilli.selectedSegmentIndex == 4) {
        milliliters = 24;
        percentage.text = @"24";
        NSLog(@"Select");
    }
    if (segmentmilli.selectedSegmentIndex == 5) {
        milliliters = 40;
        percentage.text = @"40";
        NSLog(@"Select");
    }
    
    
    
}
-(void)load {
    aantal = aantal + 1;
    
    percentagestring = percentage.text;
    hoeveelstring = hoeveel.text;
    
    hoeveelint = [[hoeveel text] intValue];
    
    percentageint = [[percentage text] intValue];
    
    if (percentageint < 5) {
        percentageint2 = 1;
    } else {
        percentageint2 = milliliters / percentageint;
       
    }
    
    
    hoeveelint = hoeveelint * percentageint2;
    NSLog(@"Percentageint 2 is: %f", hoeveelint);
    
    [[NSUserDefaults standardUserDefaults] setFloat:hoeveelint forKey:@"hoeveelint"];
    
    
    percentage.text = @"";
    hoeveel.text = @"";
    
    alert2 = [[UIAlertView alloc]
                          initWithTitle:@"Drink added"
                          message:nil
                          delegate:nil
                          cancelButtonTitle:nil
                          otherButtonTitles:nil];
    [alert2 show];
    [self performSelector:@selector(load3) withObject:nil afterDelay:1.0];
    
    
    total = total + hoeveelint;
    
    [[NSUserDefaults standardUserDefaults] setInteger:total forKey:@"glazenprom"];
    label.text = [NSString stringWithFormat:@"%f item(s) in your list", aantal];
    
    //Check real stats
    
    if ([percentage.text length]> 3) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:@"Your procents alcohol are too high!"
                              delegate:nil
                              cancelButtonTitle:@"Dismiss"
                              otherButtonTitles:nil];
        [alert show];
        percentage.text = @"100";
    }
    if ([hoeveel.text length]> 3) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:@"Your amount of glasses are too high!"
                              delegate:nil
                              cancelButtonTitle:@"Dismiss"
                              otherButtonTitles:nil];
        [alert show];
       
        hoeveel.text = @"0";
    }
    

    

    
    
    [self performSelector:@selector(load2) withObject:nil afterDelay:0.2];

}
-(void)load2 {
    textfield.editable = NO;
    textfield.selectable = NO;
}
-(void)load3 {
    [alert2 dismissWithClickedButtonIndex:0 animated:YES];
    
    glasses = glasses + hoeveelint;
    
    [[NSUserDefaults standardUserDefaults] setFloat:glasses forKey:@"glazenprom"];
    
    if (aantal == 0) {
        textfield.text = [NSString stringWithFormat:@"Glasses: %.2f", glasses];
    }
    if ( aantal > 0) {
        textfield.text = [NSString stringWithFormat:@"Glasses: %.2f",glasses];
        
    }
    
    reset.hidden = NO;
    
    
}
@end
