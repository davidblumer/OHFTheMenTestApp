//
//  AppDelegate.h
//  OHFTheMenTestApp
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ImgurSession.h"

#import <SBAlertViewHelper.h>
#import <SBLanguage.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    
}

@property (strong, nonatomic) UIWindow *window;

- (void)initAlertViewHelper;

@end