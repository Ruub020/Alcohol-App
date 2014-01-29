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
    percentage.text = @"";
    hoeveel.text = @"";
    aantal = 0;
    hoeveelint = 0;
    percentageint2 = 0;
    textfield.text = @"";
    label.text = [NSString stringWithFormat:@"%i item(s) in your list", aantal];
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
        percentageint2 = percentageint / 5;
    }
    
    
    hoeveelint = hoeveelint * percentageint2;
    NSLog(@"Percentageint 2 is: %i", hoeveelint);
    
    [[NSUserDefaults standardUserDefaults] setInteger:hoeveelint forKey:@"hoeveelint"];
    
    
    percentage.text = @"";
    hoeveel.text = @"";
    
    alert2 = [[UIAlertView alloc]
                          initWithTitle:@"Drink added"
                          message:@"Added your glasses."
                          delegate:nil
                          cancelButtonTitle:@"Dismiss"
                          otherButtonTitles:nil];
    [alert2 show];
    [self performSelector:@selector(load3) withObject:nil afterDelay:1.0];
    
    
    total = total + hoeveelint;
    
    [[NSUserDefaults standardUserDefaults] setInteger:total forKey:@"glazenprom"];
    label.text = [NSString stringWithFormat:@"%i item(s) in your list", aantal];
    
    //Check real stats
    
    if ([percentage.text length]> 3) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:@"Your procents alcohol are too heigh!"
                              delegate:nil
                              cancelButtonTitle:@"Dismiss"
                              otherButtonTitles:nil];
        [alert show];
        percentage.text = @"100";
    }
    if ([hoeveel.text length]> 3) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:@"Your amount of glasses are too heigh!"
                              delegate:nil
                              cancelButtonTitle:@"Dismiss"
                              otherButtonTitles:nil];
        [alert show];
       
        hoeveel.text = @"0";
    }
    
    if (aantal == 0) {
        textfield.text = [NSString stringWithFormat:@"%i Procent alcohol, %i glasses:", percentageint, hoeveelint];
    }
    if ( aantal > 0) {
        textfield.text = [NSString stringWithFormat:@"%@ %i Procent alcohol, %i glasses:",textfield.text, percentageint, hoeveelint];
        
    }
    

    
    
    [self performSelector:@selector(load2) withObject:nil afterDelay:0.2];

}
-(void)load2 {
    textfield.editable = NO;
    textfield.selectable = NO;
}
-(void)load3 {
    [alert2 dismissWithClickedButtonIndex:0 animated:YES];
}
@end
