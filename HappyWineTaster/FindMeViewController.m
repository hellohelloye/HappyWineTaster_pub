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

@interface FindMeViewController ()
@property (strong, nonatomic) IBOutlet UIButton *goBackBtn;
@property (strong, nonatomic) WineTasterInformation *wineTasterInfor;
@property (strong, nonatomic) NSArray *tasters;
@end

@implementation FindMeViewController

- (void)awakeFromNib {
    
    self.tasters = [[[DataGenerator alloc]wineTasterInformationGenerator] copy];
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *identifier = @"WineTasterInformation";
    if ([annotation isKindOfClass:[WineTasterInformation class]]) {
        MKAnnotationView *annotationView = (MKAnnotationView *)[_wineTasterMapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (!annotationView) {
            annotationView = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            if([mapView.delegate respondsToSelector:@selector(mapView:annotationView:calloutAccessoryControlTapped:)]) {
                annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            }
        } else {
            annotationView.annotation = annotation;
        }
        return annotationView;
    }
    return nil;
}



@end
