//
//  FindMeViewController.h
//  HappyWineTaster
//
//  Created by Yukui ye on 1/29/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "HappyWineTasterViewController.h"

@interface FindMeViewController : UIViewController <MKMapViewDelegate, MKAnnotation, CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *wineTasterMapView;
@property (strong, nonatomic) HappyWineTasterViewController *hwtvc;
@end
