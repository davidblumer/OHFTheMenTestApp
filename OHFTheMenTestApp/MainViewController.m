//
//  ViewController.m
//  OHFTheMenTestApp
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)setBeardAvailable:(BOOL)beardAvailable percent:(int)percent
{
    NSString *imageName  = (beardAvailable ? @"WithBeard" : @"WithoutBeard");
    UIImage  *beardImage = [UIImage imageNamed:imageName];
    UIImage  *whiteImage = [SBImage fillImage:beardImage withColor:[UIColor whiteColor]];
    NSString *stringName = (beardAvailable ? @"beardText" : @"noBeardText");
    
    dispatch_async(dispatch_get_main_queue(), ^
    {
        _infoLabel.text = [NSString stringWithFormat:SBL(stringName), percent];
        
        [_beardImageView setImage:whiteImage];
        
        [self restartAnimations];
    });
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)restartAnimations
{
    [self stopAllAnimations];
    [SBAnimationHelper appendPulseAnimationToLayer:_beardImageView.layer start:1.00f end:1.18f];
}

- (void)showCamera
{
    imagePicker = [[UIImagePickerController alloc] init];
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    #if TARGET_IPHONE_SIMULATOR
    {
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    #endif
    
    [imagePicker setSourceType:sourceType];
    [imagePicker setAllowsEditing:NO];
    [imagePicker setDelegate:self];
    
    if (sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        [imagePicker setCameraDevice:UIImagePickerControllerCameraDeviceRear];
    }
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)startButtonPressed:(id)sender
{
    [self showCamera];
}

- (void)stopAllAnimations
{
    [[_beardImageView layer] removeAllAnimations];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self restartAnimations];
    
    self.view.alpha = 0.0f;
    
    CALayer *buttonLayer = [_startButton layer];
    
    [buttonLayer setBorderWidth:2.0f];
    [buttonLayer setBorderColor:[UIColor whiteColor].CGColor];
    [buttonLayer setCornerRadius:5.0f];
    
    self.title = SBL(@"appTitle");
    
    UIImage  *beardImage = [UIImage imageNamed:@"QuestionMark"];
    UIImage  *whiteImage = [SBImage fillImage:beardImage withColor:[UIColor whiteColor]];
    
    [_beardImageView setImage:whiteImage];
    
    [_startButton setTitle:SBL(@"startTest") forState:UIControlStateNormal];
    _infoLabel.text = SBL(@"startText");
    
    
    [NSThread sleepForTimeInterval:0.25f];
    [SBAnimationHelper setOpacityAnimated:1.0f view:self.view];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [ImageProcessor processImage:image callback:^(BOOL isMan, int percent)
    {
        [imagePicker dismissViewControllerAnimated:YES completion:nil];
        
        [SVProgressHUD dismiss];
        
        [self setBeardAvailable:isMan percent:percent];
    }];
}

@end
