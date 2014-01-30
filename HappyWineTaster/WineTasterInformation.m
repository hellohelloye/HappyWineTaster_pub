//
//  WineTasterInformation.m
//  HappyWineTaster
//
//  Created by Yukui ye on 1/29/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import "WineTasterInformation.h"

@implementation WineTasterInformation

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}


+ (id)wineTasterInformationFromDictionary:(NSDictionary *)taster {
    
    WineTasterInformation *wineTaster = [[WineTasterInformation alloc]init];
    wineTaster.name = [taster objectForKey:@"name"];
    wineTaster.jobTitle = [taster objectForKey:@"jobtitle"];
    wineTaster.tastingBeat = [taster objectForKey:@"tastingbeat"];
    wineTaster.introduction = [taster objectForKey:@"introduction"];
    wineTaster.location = [taster objectForKey:@"location"];
    
    wineTaster.coordinate = CLLocationCoordinate2DMake([[wineTaster.location objectForKey:@"latitude"] floatValue], [[wineTaster.location objectForKey:@"longitude"] floatValue]);
    
    return wineTaster;
}

@end
