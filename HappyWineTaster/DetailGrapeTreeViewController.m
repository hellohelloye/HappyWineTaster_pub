//
//  DetailGrapeTreeViewController.m
//  HappyWineTaster
//
//  Created by Yukui ye on 2/6/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import "DetailGrapeTreeViewController.h"

@interface DetailGrapeTreeViewController ()

@end

@implementation DetailGrapeTreeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    UIImage *myImage = [self scaleImage:[UIImage imageNamed:@"LadyDrink"] toSize:self.view.frame.size];
    self.view.backgroundColor = [UIColor colorWithPatternImage:myImage];
    
}


- (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndPDFContext();
    
    return newImage;
}


@end
