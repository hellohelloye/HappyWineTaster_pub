//
//  FindMeViewController.h
//  HappyWineTaster
//
//  Created by Yukui ye on 1/29/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "HappyWineTasterViewController.h"

@interface FindMeViewController : UIViewController <MKMapViewDelegate, MKAnnotation, CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *wineTasterMapView;
@property (strong, nonatomic) IBOutlet UILabel *destinationLabel;
@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *transportLabel;
@property (strong, nonatomic) IBOutlet UITextView *stepsTextView;
@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (strong, nonatomic) IBOutlet UIToolbar *myToolBar;

@property (strong, nonatomic) NSString *allSteps;

@end
