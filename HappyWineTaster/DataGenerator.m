//
//  DataGenerator.m
//  HappyWineTaster
//
//  Created by Yukui ye on 2/3/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import "DataGenerator.h"
#import "WineTasterInformation.h"


@implementation DataGenerator

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (NSArray *)wineTasterInformationGenerator {
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSURL *wineTasterURL = [mainBundle URLForResource:@"WineTasterInformation" withExtension:@"plist"];
    NSMutableArray *helperArray = [[NSMutableArray alloc]init];
    helperArray = [NSArray arrayWithContentsOfURL:wineTasterURL];
    
    NSMutableArray *helper = [[NSMutableArray alloc]init];
    for (NSDictionary *item in helperArray) {
        [helper addObject:[WineTasterInformation wineTasterInformationFromDictionary:item]];
    }
    
    return helper;
}

- (GrapeTreeInformation *)grapeTreeInformationGenerator {
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSURL *grapeTreeURL = [mainBundle URLForResource:@"wineTreeJsonData" withExtension:@"txt"];
    NSData *jsonData = [NSData dataWithContentsOfURL:grapeTreeURL];
    NSMutableDictionary *helperDict = [[NSMutableDictionary alloc]init];
    helperDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    GrapeTreeInformation *grapeTree = [GrapeTreeInformation GrapeTreeInformationFromDictionary:helperDict];;
    
    return grapeTree;
}

@end
