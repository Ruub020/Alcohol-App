//
//  disclaimerViewController.m
//  MID
//
//  Created by Boike Damhuis on 20-01-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import "disclaimerViewController.h"

@interface disclaimerViewController ()

@end

@implementation disclaimerViewController

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
    NSString *thePath = [[NSBundle mainBundle] pathForResource:@"d" ofType:@"pdf"];
    
    if (thePath) {
        
        NSData *pdfData = [NSData dataWithContentsOfFile:thePath];
        
        [_webview2 loadData:pdfData MIMEType:@"application/pdf"
         
                        textEncodingName:@"utf-8" baseURL:nil];

}
    _webview2.scalesPageToFit = YES;
}

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

@end
