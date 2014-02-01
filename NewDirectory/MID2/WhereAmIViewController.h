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

<<<<<<< HEAD
@interface WhereAmIViewController : ViewController <MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate, UIActionSheetDelegate> {
    
=======
@interface WhereAmIViewController : ViewController <MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate, UIActionSheetDelegate, MKMapViewDelegate> {
    MKMapView *mapview;
>>>>>>> 85b38f89b7a10bb6d4cbb55136cd07fc6a62da2f
    CLLocationCoordinate2D getLocation;
    CLLocationManager *locationManager;
    
    float latitude;
    float longitude;
    __weak IBOutlet MKMapView *mapview;
    
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
