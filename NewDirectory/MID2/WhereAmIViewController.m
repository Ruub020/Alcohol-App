//
//  WhereAmIViewController.m
//  MID
//
//  Created by Boike Damhuis on 19-01-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import "WhereAmIViewController.h"
#import "WhatsAppKit.h"

@interface WhereAmIViewController ()

@end

@implementation WhereAmIViewController

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
    
    mapview.showsUserLocation = YES;
    mapview.mapType = MKMapTypeStandard;
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [locationManager startUpdatingLocation];
    
    latitude = locationManager.location.coordinate.latitude;
    longitude = locationManager.location.coordinate.longitude;
    
    NSLog(@"%f", longitude);
    NSLog(@"%f", latitude);
    
    phonenumber = [[NSUserDefaults standardUserDefaults] objectForKey:@"NUMBER"];
    NSLog(@"Phonnumber: %@", phonenumber);
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
-(IBAction)gethelp:(id)sender
{
    UIActionSheet *Choosesource = [[UIActionSheet alloc] initWithTitle:@"Choose source" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"SMS",@"WhatsApp", nil];
    [Choosesource showInView:self.view];
    
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        [self sourceSMS];
    }
    if (buttonIndex==1) {
        [self sourceWhatsapp];
    }
}
-(void)sourceSMS
{
    NSString *strFromInt = [NSString stringWithFormat:@"%@",phonenumber];
    NSString *urlAddress = [NSString stringWithFormat:@"https://maps.google.com/maps?q=%f,%f",latitude, longitude];
    if(![MFMessageComposeViewController canSendText]) {
        UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device doesn't support SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [warningAlert show];
        return;
    }
    
    NSArray *recipents = [[strFromInt componentsSeparatedByString: @","] mutableCopy];
    NSString *message = [NSString stringWithFormat:@"I've had to much to drink. Could you pick me up? %@", urlAddress];
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.messageComposeDelegate = self;
    [messageController setRecipients:recipents];
    [messageController setBody:message];
    
    // Present message view controller on screen
    [self presentViewController:messageController animated:YES completion:nil];
}
-(void)sourceWhatsapp
{
    NSString *urlAddress = [NSString stringWithFormat:@"https://maps.google.com/maps?q=%f,%f",latitude, longitude];
    NSString *message = [NSString stringWithFormat:@"I've had to much to drink. Could you pick me up? %@", urlAddress];
    if ([WhatsAppKit isWhatsAppInstalled]) {
        //Whatsapp is installed
        [WhatsAppKit launchWhatsAppWithMessage:message];

    }else{
        UIAlertView *WhatsAppNotInstalledError = [[UIAlertView alloc] initWithTitle:@"Not Installed" message:@"WhatsApp is not installed on this device." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [WhatsAppNotInstalledError show];
    }
}


- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result
{
    switch (result) {
        case MessageComposeResultCancelled:
            break;
            
        case MessageComposeResultFailed:
        {
            UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to send SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [warningAlert show];
            break;
        }
            
        case MessageComposeResultSent:
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
