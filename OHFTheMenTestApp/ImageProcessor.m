//
//  ImageProcessor.m
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import "ImageProcessor.h"

@implementation ImageProcessor

+ (void)processImage:(UIImage *)image callback:(ImageProcessorCallback)callback
{
    ClarifaiClient *client = [[ClarifaiClientFactory sharedClarifaiClientFactory] client];
    
    // TODO: Scale down?
    
    NSData *jpegData = UIImageJPEGRepresentation(image, 0.9);
    /*
    [IMGImageRequest uploadImageWithData:jpegData title:@"Beard" success:^(IMGImage *image)
    {
        
    }
    progress:nil failure:^(NSError *error)
    {
        callback(NO);
    }];
    
    */
    
    
    [client predictJpegs:@[jpegData] conceptNamespace:@"default" conceptName:@"beard" completion:^(NSArray *results, NSError *error)
    {
         if (error)
         {
             callback(NO);
         }
         else
         {
             ClarifaiPredictionResult *result = results.firstObject;
             callback(result.score > 0.5f);
             
             NSString *resultString = [NSString stringWithFormat:@".2f", result.score];
             [SBAlertViewHelper showErrorAlertViewWithText:resultString];
         }
     }];
}

@end