//
//  RemoveAdsViewController.h
//  MID
//
//  Created by Boike Damhuis on 01-03-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

@interface RemoveAdsViewController : UIViewController <SKProductsRequestDelegate,SKPaymentTransactionObserver> {
    BOOL ads;
    __weak IBOutlet UILabel *label;
    __weak IBOutlet UIButton *buy;
}
-(IBAction)ButtonPressed:(id)sender;
-(IBAction)restore:(id)sender;

- (void) completeTransaction: (SKPaymentTransaction *)transaction;
- (void) restoreTransaction: (SKPaymentTransaction *)transaction;
- (void) failedTransaction: (SKPaymentTransaction *)transaction;
@end
