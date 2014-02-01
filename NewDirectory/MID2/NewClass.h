//
//  NewClass.h
//  MID
//
//  Created by Boike Damhuis on 01-02-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>

@interface NewClass : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
    
    CLLocationCoordinate2D Spain;
    NSString *titleSpain;
    NSString *subtitleSpain;
}
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@end