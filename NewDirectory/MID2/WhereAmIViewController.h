//
//  WhereAmIViewController.h
//  MID
//
//  Created by Boike Damhuis on 19-01-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MessageUI/MessageUI.h>

@interface WhereAmIViewController : ViewController <MFMailComposeViewControllerDelegate> {
    MKMapView *mapview;
    CLLocationCoordinate2D getLocation;
    CLLocationManager *locationManager;
    
    float latitude;
    float longitude;
    
    int phonenumber;
    NSArray *nummer;

}
@property (weak, nonatomic) IBOutlet MKMapView *mapview;
-(IBAction)gethelp:(id)sender;

@end
