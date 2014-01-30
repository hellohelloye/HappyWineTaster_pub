//
//  WineTasterInformation.h
//  HappyWineTaster
//
//  Created by Yukui ye on 1/29/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface WineTasterInformation : NSObject <CLLocationManagerDelegate>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *jobTitle;
@property (strong, nonatomic) NSDictionary *location;
@property (strong, nonatomic) NSString *tastingBeat;
@property (strong, nonatomic) NSString *introduction;

@property (assign, nonatomic) CLLocationCoordinate2D coordinate;

+ (id)wineTasterInformationFromDictionary:(NSDictionary *)taster;

@end
