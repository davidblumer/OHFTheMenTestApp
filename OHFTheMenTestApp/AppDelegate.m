//
//  AppDelegate.m
//  OHFTheMenTestApp
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [IMGSession anonymousSessionWithClientID:@"04cc6ae571c2f47" withDelegate:self];
    [self initAlertViewHelper];
    
    
    return YES;
}

- (void)initAlertViewHelper
{
    [SBAlertViewHelper setTexts:SBL(@"ok") errorTitle:SBL(@"anErrorOccurred")];
}

@end