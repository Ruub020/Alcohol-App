//
//  DownloadImagesViewController.m
//  MID
//
//  Created by Boike Damhuis on 31-01-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import "DownloadImagesViewController.h"

@interface DownloadImagesViewController ()

@end

@implementation DownloadImagesViewController

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
    _imageView.image = [UIImage imageNamed:urlimage];
    count = -1;
    
    if (switch2 == 1) {
        [_switch2 isOn];
        
        
    } else {
        _switch2.on = NO;
    }

}
-(IBAction)download:(id)sender {

    [self Again];
    _imageView.image = [UIImage imageNamed:@"../CF5B8833-CA7C-45FF-8873-25FB2FA9364C/Documents/bg2.jpeg"];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.length = [response expectedContentLength];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.imageData appendData:data];
    float progress =  (float)[_imageData length]/(float)self.length;
    self.timeLabel.text = [NSString stringWithFormat:@"%0.2f%%",progress*100];
    [self.progressView setProgress:progress animated:YES];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError");
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    UIImage *img = [UIImage imageWithData:self.imageData];
    self.imageView.image = img;
    [self saveLocally:self.imageData];
}
- (void)saveLocally:(NSData *)imgData
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSDate *aDate = [NSDate date];
    NSTimeInterval interval = [aDate timeIntervalSince1970];
    NSString *localFilePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"bg%d.jpeg",count]];
    [imgData writeToFile:localFilePath atomically:YES];
    
    [self performSelector:@selector(Again) withObject:nil afterDelay:0.1];
    
    urlimage = localFilePath;
    NSLog(@"Path is: %@", urlimage);
    
    [[NSUserDefaults standardUserDefaults] setObject:urlimage2 forKey:@"urlimage"];
    urlimage1 = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"bg1.jpeg"]];
    urlimage2 = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"bg2.jpeg"]];
    urlimage3 = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"bg3.jpeg"]];
    urlimage4 = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"bg4.jpeg"]];
    urlimage5 = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"bg5.jpeg"]];
    urlimage6 = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"bg6.jpeg"]];
    urlimage7 = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"bg7.jpeg"]];
    urlimage8 = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"bg8.jpeg"]];
    urlimage9 = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"bg9.jpeg"]];
    urlimage0 = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"bg0.jpeg"]];
    [[NSUserDefaults standardUserDefaults] setObject:urlimage1 forKey:@"urlimage1"];
    [[NSUserDefaults standardUserDefaults] setObject:urlimage2 forKey:@"urlimage2"];
    [[NSUserDefaults standardUserDefaults] setObject:urlimage3 forKey:@"urlimage3"];
    [[NSUserDefaults standardUserDefaults] setObject:urlimage4 forKey:@"urlimage4"];
    [[NSUserDefaults standardUserDefaults] setObject:urlimage5 forKey:@"urlimage5"];
    [[NSUserDefaults standardUserDefaults] setObject:urlimage6 forKey:@"urlimage6"];
    [[NSUserDefaults standardUserDefaults] setObject:urlimage7 forKey:@"urlimage7"];
    [[NSUserDefaults standardUserDefaults] setObject:urlimage8 forKey:@"urlimage8"];
    [[NSUserDefaults standardUserDefaults] setObject:urlimage9 forKey:@"urlimage9"];
    [[NSUserDefaults standardUserDefaults] setObject:urlimage0 forKey:@"urlimage0"];
}
-(void) Again {
    if (count < 10) {
        count = count +1;
        url = [NSString stringWithFormat:@"http://moreapple.comze.com/bg%d.png", count];
        self.imageData = [[NSMutableData alloc]init];
        [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]delegate:self];
    }
    
    
  
    
}
-(IBAction)set:(id)sender {
    NSLog(@"%@", urlimage2);
    _imageView.image = [UIImage imageWithContentsOfFile:urlimage2];
}
-(void)awakeFromNib {
    urlimage1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage1"];
    urlimage2 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage2"];
    urlimage3 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage3"];
    urlimage4 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage4"];
    urlimage5 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage5"];
    urlimage6 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage6"];
    urlimage7 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage7"];
    urlimage8 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage8"];
    urlimage9 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage9"];
    urlimage0 = [[NSUserDefaults standardUserDefaults] objectForKey:@"urlimage0"];
    NSLog(@"Awake");
    NSLog(@"Urlimage is: %@", urlimage);
}

- (IBAction)switch2:(id)sender {
  
}
@end
