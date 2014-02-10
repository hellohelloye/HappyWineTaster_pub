//
//  Utility.m
//  HappyWineTaster
//
//  Created by Yukui ye on 2/10/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import "Utility.h"

@implementation Utility

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndPDFContext();
    
    return newImage;
}

@end
