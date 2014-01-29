//
//  AppDelegate.m
//  MID
//
//  Created by Boike Damhuis on 17-01-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    // Override point for customization after application launch.
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
    {
        CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
        
        if (iOSDeviceScreenSize.height == 480)
        {
            UIStoryboard *iPhone35Storyboard = [UIStoryboard storyboardWithName:@"iOS7-3,5inch" bundle:nil];
            UIViewController *initialViewController = [iPhone35Storyboard instantiateInitialViewController];
            self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            self.window.rootViewController  = initialViewController;
            [self.window makeKeyAndVisible];
            
            self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
            
            if (![[NSUserDefaults standardUserDefaults] boolForKey:@"root1"]) {
                //First launch, passing to "Root" in storyboard
                UIViewController *viewController = [iPhone35Storyboard instantiateViewControllerWithIdentifier:@"root"];
                
                self.window.rootViewController = viewController;
                [self.window makeKeyAndVisible];
               
            }
            else {
                UIViewController *viewController = [iPhone35Storyboard instantiateViewControllerWithIdentifier:@"default"];
                
                self.window.rootViewController = viewController;
                [self.window makeKeyAndVisible];
            }
            
      
        }
        
        if (iOSDeviceScreenSize.height == 568)
        {
            UIStoryboard *iPhone4Storyboard = [UIStoryboard storyboardWithName:@"iOS7-4inch"bundle:nil];
            UIViewController *initialViewController = [iPhone4Storyboard instantiateInitialViewController];
            self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            self.window.rootViewController  = initialViewController;
            [self.window makeKeyAndVisible];
           
            
            if (![[NSUserDefaults standardUserDefaults] boolForKey:@"root2"]) {
                //First launch, passing to "Root" in storyboard
                UIViewController *viewController = [iPhone4Storyboard instantiateViewControllerWithIdentifier:@"root"];
                
                self.window.rootViewController = viewController;
                [self.window makeKeyAndVisible];
                
               
            }
            else {
                
                UIViewController *viewController = [iPhone4Storyboard instantiateViewControllerWithIdentifier:@"default"];
                
                self.window.rootViewController = viewController;
                [self.window makeKeyAndVisible];
                
            }
            
            return YES;
    }
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    enable = [[NSUserDefaults standardUserDefaults] integerForKey:@"aan"];
    date = [[NSUserDefaults standardUserDefaults] integerForKey:@"plus"];
    date2 = [[NSUserDefaults standardUserDefaults] integerForKey:@"plus2"];
    preciesglazen = 0;
    preciesglazen = [[NSUserDefaults standardUserDefaults] integerForKey:@"glazenprom"];
    
    if ( enable == 2) {
        
        NSLog(@"Push is enabled on your iPhone");
        
        
        if (date > 0) {
            
     
            date = date *60 *60;
            
            
                
                UILocalNotification* localNotification = [[UILocalNotification alloc] init];
                localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:date];
                localNotification.alertBody = @"Check your BAC, we think it's 0!";
                localNotification.timeZone = [NSTimeZone defaultTimeZone];
                localNotification.soundName = @"sound.mp3";
                [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
            
                
            
                [[NSUserDefaults standardUserDefaults] setInteger:date forKey:@"plus"];
                    
                
                

            
            
            
            if (date2 > 0) {
                date2 = date2 *60 *60;
                
                
                
                    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
                    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:date2];
                    localNotification.alertBody = @"Check your BAC, we think it's legal again!";
                    localNotification.timeZone = [NSTimeZone defaultTimeZone];
                    localNotification.soundName = @"sound.mp3";
                    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
                
                    
                
                    [[NSUserDefaults standardUserDefaults] setInteger:date2 forKey:@"plus2"];
                        
                    
                    
                    

                
                
                }
            
            NSLog(@"Firedates: Push to 0: %i. Push to legal: %i.", date, date2);
            
            
            
           
            
            
            

    }

}}



-(void)check {
 
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    date2 = 0;
    date = 0;
    [[NSUserDefaults standardUserDefaults] setInteger:date2 forKey:@"plus2"];
    [[NSUserDefaults standardUserDefaults] setInteger:date forKey:@"plus"];
    
    application.applicationIconBadgeNumber = 0;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
