//
//  LoadingViewController.m
//  MID
//
//  Created by Boike Damhuis on 21-01-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import "LoadingViewController.h"

@interface LoadingViewController ()

@end

@implementation LoadingViewController

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
    
    [_loader startAnimating];
    [self performSelector:@selector(een) withObject:nil afterDelay:4];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)een {
    [self performSegueWithIdentifier:@"Loading" sender:self];

}
-(void)twee {
    
}
@end
