//
//  ViewController.h
//  OHFTheMenTestApp
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <SVProgressHUD.h>

#import <SBLanguage.h>
#import <SBAlertViewHelper.h>

#import "ImageProcessor.h"

@interface MainViewController : UIViewController <UIImagePickerControllerDelegate>
{
    @private
        UIImagePickerController *imagePicker;
    
}

- (void)showCamera;

@end