//
//  FirstViewController.m
//  MID
//
//  Created by Boike Damhuis on 18-01-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    
    
    return self;
}
- (IBAction)DoneButtonClicked:(id)sender {
    NSUserDefaults *Prefs = [NSUserDefaults standardUserDefaults];
    //Gewicht
    NSString *Weight = label5.text;
    //Sla gewicht op
    [Prefs setObject:Weight forKey:@"Weight"];
    [Prefs synchronize];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    label1.alpha = 0;
    label2.alpha = 0;
    label3.alpha = 0;
    label4.alpha = 0;
    label5.alpha = 0;
    button.alpha = 0;
    segment.alpha = 0;
    NSLog(@"Start fading");
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.5];
    [label1 setAlpha:1];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    [label2 setAlpha:1];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.5];
    [label3 setAlpha:1];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2.0];
    [label4 setAlpha:1];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2.5];
    [label5 setAlpha:1];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:3.0];
    [segment setAlpha:1];
    [UIView commitAnimations];
    
    
    if ([label5.text length] > 0) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:2.5];
        [button setAlpha:1];
        [UIView commitAnimations];
    }

	// Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [label5 resignFirstResponder];
    NSLog(@"End of editon, button alpha to 1 if the lenght is > 0");
    if ([label5.text length] > 0) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:2.5];
        [button setAlpha:1];
        [UIView commitAnimations];
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"root2"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"root1"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)awakeFromNib {
    
    
}
-(IBAction)switch:(id)sender {
    switch (segment.selectedSegmentIndex) {
        case 0:
            manvrouw2 = 0.72;
            NSLog(@"Manvrouw is 0.72");
            [self performSelector:@selector(check)];
            break;
        case 1:
            manvrouw2 = 0.61;
            NSLog(@"Manvrouw is 0.61");
            [self performSelector:@selector(check)];
            break;
        default:
            break;
            
    
    }


}
-(void)check {
    [[NSUserDefaults standardUserDefaults] setFloat:manvrouw2 forKey:@"keyfloat"];
    NSLog(@"checked");
}


@end
