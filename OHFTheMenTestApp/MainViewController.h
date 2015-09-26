//
//  ViewController.h
//  OHFTheMenTestApp
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#import <SVProgressHUD.h>

#import <SBLanguage.h>
#import <SBAlertViewHelper.h>
#import <SBImage.h>

#import "ImageProcessor.h"

@interface MainViewController : UIViewController <UIImagePickerControllerDelegate>
{
    @private
        UIImagePickerController *imagePicker;
    
}

@property (weak, nonatomic) IBOutlet UIImageView *beardImageView;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

- (void)setBeardAvailable:(BOOL)beardAvailable percent:(int)percent;
- (void)showCamera;

@end