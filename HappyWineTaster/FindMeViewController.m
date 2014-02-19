//
//  FindMeViewController.m
//  HappyWineTaster
//
//  Created by Yukui ye on 1/29/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import "FindMeViewController.h"
#import "WineTasterInformation.h"
#import "HappyWineTasterViewController.h"
#import "DataGenerator.h"
#import "Utility.h"

@interface FindMeViewController ()
@property (strong, nonatomic) IBOutlet UIButton *goBackBtn;
@property (strong, nonatomic) WineTasterInformation *wineTasterInfor;
@property (strong, nonatomic) NSArray *tasters;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *leftBarItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *rightBarItem;

@property (strong, nonatomic) IBOutlet UILabel *destinationStatic;
@property (strong, nonatomic) IBOutlet UILabel *distanceStatic;
@property (strong, nonatomic) IBOutlet UILabel *transportStatic;
@property (strong, nonatomic) IBOutlet UILabel *stepStatic;

@end

@implementation FindMeViewController

CLPlacemark *thePlacemark;
MKRoute *routeDetails;

- (void)awakeFromNib {
    
    self.tasters = [[[DataGenerator alloc] wineTasterInformationGenerator] copy];
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *myBackgroudImage = [[Utility alloc] scaleImage:[UIImage imageNamed:@"wineTaster"] toSize:self.myScrollView.frame.size];
    self.myScrollView.backgroundColor = [UIColor colorWithPatternImage:myBackgroudImage];
    self.myToolBar.barTintColor = [UIColor lightGrayColor];
    self.myToolBar.barStyle = UIBarStyleBlackTranslucent;
    
    [self propertiesDecoration];
}

- (void)propertiesDecoration {
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor whiteColor];
    shadow.shadowOffset = CGSizeMake(1, 0);
    
    [self.leftBarItem setTitleTextAttributes:@{
                                               NSForegroundColorAttributeName: [UIColor blackColor],
                                               NSShadowAttributeName:shadow,
                                               NSFontAttributeName:[UIFont fontWithName:@"Zapfino" size:10.0f]
                                               }
                                    forState:UIControlStateNormal];
    [self.rightBarItem setTitleTextAttributes:@{
                                                NSForegroundColorAttributeName: [UIColor blackColor],
                                                NSShadowAttributeName:shadow,
                                                NSFontAttributeName:[UIFont fontWithName:@"Zapfino" size:10.0f]
                                                }
                                     forState:UIControlStateNormal];
    
    [self customMyLableStyle:self.destinationStatic];
    [self customMyLableStyle:self.distanceStatic];
    [self customMyLableStyle:self.transportStatic];
    [self customMyLableStyle:self.stepStatic];
    


    self.stepsTextView.backgroundColor = [UIColor clearColor];
}

- (void)customMyLableStyle: (UILabel *)mylabel {
    mylabel.font = [UIFont fontWithName:@"Zapfino" size:10.0f];
    mylabel.shadowColor = [UIColor blackColor];
    mylabel.textColor = [UIColor whiteColor];
    mylabel.shadowOffset = CGSizeMake(1.5, 0);
}

- (void)setWineTasterMapView:(MKMapView *)wineTasterMapView {
    _wineTasterMapView = wineTasterMapView;
    self.wineTasterMapView.delegate = self;
    //[self.wineTasterMapView addAnnotations:self.tasters];
   // [self.wineTasterMapView showAnnotations:self.tasters animated:YES];
    if (self.tasters) {
        [self showAnnotationsWithinMapVisibleRect:self.tasters];
    } else {
        NSLog(@"no data");
    }
}

- (IBAction)pushBackBtn:(id)sender {
/*                           [self.view removeFromSuperview];
                             [self removeFromParentViewController];
                             [self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];
*/
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}


- (IBAction)addressSearch:(UITextField *)sender {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:sender.text completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            thePlacemark = [placemarks lastObject];
            float spanX = 1.00725;
            float spanY = 1.00725;
            MKCoordinateRegion region;
            region.center.latitude = thePlacemark.location.coordinate.latitude;
            region.center.longitude = thePlacemark.location.coordinate.longitude;
            region.span = MKCoordinateSpanMake(spanX, spanY);
            [self.wineTasterMapView setRegion:region animated:YES];
            [self addAnnotation:thePlacemark];
        }
    }];
}

- (void)addAnnotation: (CLPlacemark *)placemark {
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = CLLocationCoordinate2DMake(placemark.location.coordinate.latitude, placemark.location.coordinate.longitude);
    point.title = [placemark.addressDictionary objectForKey:@"Street"];
    point.subtitle = [placemark.addressDictionary objectForKey:@"City"];
    [self.wineTasterMapView addAnnotation:point];
}


- (IBAction)routeButtonPressed:(UIBarButtonItem *)sender {
    MKDirectionsRequest *directionsRequest = [[MKDirectionsRequest alloc] init];
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:thePlacemark];
    [directionsRequest setSource:[MKMapItem mapItemForCurrentLocation]];
    [directionsRequest setDestination:[[MKMapItem alloc] initWithPlacemark:placemark]];
    directionsRequest.transportType = MKDirectionsTransportTypeAutomobile;
    MKDirections *directions = [[MKDirections alloc] initWithRequest:directionsRequest];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error %@", error.description);
        } else {
            routeDetails = response.routes.lastObject;
            [self.wineTasterMapView addOverlay:routeDetails.polyline];
            self.destinationLabel.text = [placemark.addressDictionary objectForKey:@"Street"];
            self.distanceLabel.text = [NSString stringWithFormat:@"%0.1f Miles", routeDetails.distance/1609.344];
            self.transportLabel.text = [NSString stringWithFormat:@"%u",routeDetails.transportType];
            self.allSteps = @"";
            for (int i = 0; i < routeDetails.steps.count; i++) {
                MKRouteStep *step = [routeDetails.steps objectAtIndex:i];
                NSString *newStep = step.instructions;
                self.allSteps = [self.allSteps stringByAppendingString:newStep];
                self.allSteps = [self.allSteps stringByAppendingString:@"\n\n"];
                self.stepsTextView.text = self.allSteps;
            }
            
            [self customMyLableStyle:self.destinationLabel];
            [self customMyLableStyle:self.distanceLabel];
            [self customMyLableStyle:self.transportLabel];
        
            self.stepsTextView.font = [UIFont fontWithName:@"Zapfino" size:10.0f];
            
        }
    }];
}

- (IBAction)clearRoute:(UIBarButtonItem *)sender {
    self.destinationLabel.text = nil;
    self.distanceLabel.text = nil;
    self.transportLabel.text = nil;
    self.stepsTextView.text = nil;
    [self.wineTasterMapView removeOverlay:routeDetails.polyline];
}


- (BOOL)mapViewContainsLocation:(WineTasterInformation *)location {
    __block BOOL found = NO;
    [self.wineTasterMapView.annotations enumerateObjectsUsingBlock:^(id<MKAnnotation> annotation, NSUInteger idx, BOOL *stop) {
        if (![annotation isKindOfClass:[WineTasterInformation class]] && annotation.coordinate.longitude == location.coordinate.longitude && annotation.coordinate.latitude == location.coordinate.latitude) {
            found = YES;
            *stop = YES;
        }
    }];
    return found;}

- (void)showAnnotationsWithinMapVisibleRect:(NSArray *)tasters {
    for (WineTasterInformation *wineTaster in tasters) {
            if (![self mapViewContainsLocation:wineTaster]) {
                MKPointAnnotation *helperAnnotation = [[MKPointAnnotation alloc]init];
                helperAnnotation.coordinate = wineTaster.coordinate;
                helperAnnotation.title = wineTaster.name;
                helperAnnotation.subtitle = wineTaster.jobTitle;
                [self.wineTasterMapView addAnnotation:helperAnnotation];
            }
    }
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKPolylineRenderer *routeLineRender = [[MKPolylineRenderer alloc] initWithPolyline:routeDetails.polyline];
    routeLineRender.strokeColor = [UIColor redColor];
    routeLineRender.lineWidth = 3;
    return routeLineRender;
}

//////////////////////////////////////
/////// add two different type annotation ???  ---waiting for exploring
//testing testing testing githubs forking merging
/////////////
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[WineTasterInformation class]]) {
        MKAnnotationView *annotationView = (MKAnnotationView *)[_wineTasterMapView dequeueReusableAnnotationViewWithIdentifier:@"WineTasterInformation"];
        if (!annotationView) {
            annotationView = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"WineTasterInformation"];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            annotationView.backgroundColor = [UIColor darkGrayColor];
            if([mapView.delegate respondsToSelector:@selector(mapView:annotationView:calloutAccessoryControlTapped:)]) {
                annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            }
        } else {
            annotationView.annotation = annotation;
        }
        return annotationView;
    } else if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    } else {
        MKPinAnnotationView *pinView = (MKPinAnnotationView *)[self.wineTasterMapView dequeueReusableAnnotationViewWithIdentifier:@"CustumPinAnnotationView"];
        if (!pinView) {
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            //pinView.pinColor = MKPinAnnotationColorPurple;
            pinView.canShowCallout = YES;
        } else {
            pinView.annotation = annotation;
            pinView.pinColor = MKPinAnnotationColorPurple;
        }
        return pinView;
    }
    
    return nil;
}

@end
