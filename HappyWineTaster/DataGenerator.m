//
//  DataGenerator.m
//  HappyWineTaster
//
//  Created by Yukui ye on 2/3/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import "DataGenerator.h"
#import "WineTasterInformation.h"
#import "HWTNode.h"
#import "GrapeTreeInformation.h"

@interface DataGenerator ()
@property (strong, nonatomic) HWTNode *rootNode;
@end


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


- (HWTNode *)createNodeFromKey:(NSString*)key andObject:(id)obj {
    HWTNode *node = [[HWTNode alloc] initWithName:key];
    if ([obj isKindOfClass:[NSArray class]]) {
        [obj enumerateObjectsUsingBlock:^(id name, NSUInteger idx, BOOL *stop) {
            HWTNode *childNode = [[HWTNode alloc] initWithName:name];
            [node addChildNode:childNode];
        }];
    } else {
        NSDictionary *objDict = (NSDictionary*)obj;
        [objDict enumerateKeysAndObjectsUsingBlock:^(id innerKey, id innerObj, BOOL *stop) {
            [node addChildNode:[self createNodeFromKey:innerKey andObject:innerObj]];
        }];
    }
    return node;
}

- (GrapeTreeInformation *)grapeTreeInformationGenerator {
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSURL *grapeTreeURL = [mainBundle URLForResource:@"wineTreeJsonData" withExtension:@"txt"];
    NSData *jsonData = [NSData dataWithContentsOfURL:grapeTreeURL];
    NSMutableDictionary *helperDict = [[NSMutableDictionary alloc] init];
    helperDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    self.rootNode = [[HWTNode alloc] initWithName:@"wine"];
    
    [helperDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [self.rootNode addChildNode:[self createNodeFromKey:key andObject:obj]];
    }];
    
    GrapeTreeInformation *grapeTree = [GrapeTreeInformation GrapeTreeInformationFromNode:self.rootNode];
    
//    [self.rootNode.children enumerateObjectsUsingBlock:^(HWTNode *obj, NSUInteger idx, BOOL *stop) {
//        NSLog(@"%@", obj.name);
//        if (obj.children) {
//            [obj.children enumerateObjectsUsingBlock:^(HWTNode *obj, NSUInteger idx, BOOL *stop) {
//                 NSLog(@"%@", obj.name);
//            }];
//        }
//    }];
    
//    HWTNode *first = [self.rootNode.children firstObject];
//    [first.children enumerateObjectsUsingBlock:^(HWTNode *obj, NSUInteger idx, BOOL *stop) {
//        NSLog(@"%@", obj.name);
//    }];
    
    return grapeTree;
  //  return nil;
}

@end
