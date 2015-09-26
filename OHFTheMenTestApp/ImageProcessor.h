//
//  ImageProcessor.h
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <SBAlertViewHelper.h>
#import <SBLanguage.h>

#import "ClarifaiClient.h"
#import "IMGImageRequest.h"

#import "ClarifaiClientFactory.h"

typedef void (^ImageProcessorCallback)(BOOL isMan, int percent);

@interface ImageProcessor : NSObject
{
    
}

+ (void)processImage:(UIImage *)image callback:(ImageProcessorCallback)callback;

@end