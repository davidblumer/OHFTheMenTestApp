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
    
    CGSize size = CGSizeMake(320, 320 * image.size.height / image.size.width);
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    NSData *jpegData = UIImageJPEGRepresentation(scaledImage, 0.9);
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
             callback(NO, 0);
         }
         else
         {
             ClarifaiPredictionResult *result = results.firstObject;
             callback(result.score > 0.5f, (int)(result.score * 100.0f));
         }
     }];
}

@end