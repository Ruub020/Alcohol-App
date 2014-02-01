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

@interface WhereAmIViewController : ViewController <MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate, UIActionSheetDelegate, MKMapViewDelegate> {
    MKMapView *mapview;
    CLLocationCoordinate2D getLocation;
    CLLocationManager *locationManager;
    
    float latitude;
    float longitude;
    
    NSString *phonenumber;
    NSArray *nummer;
    
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;

}
@property (weak, nonatomic) IBOutlet MKMapView *mapview;
-(IBAction)gethelp:(id)sender;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;


@end
