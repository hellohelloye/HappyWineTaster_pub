//
//  DataGenerator.h
//  HappyWineTaster
//
//  Created by Yukui ye on 2/3/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GrapeTreeInformation.h"

@interface DataGenerator : NSObject

- (NSArray *)wineTasterInformationGenerator;
- (GrapeTreeInformation *)grapeTreeInformationGenerator;

@end
