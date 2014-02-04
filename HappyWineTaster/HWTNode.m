//
//  HWTNode.m
//  HappyWineTaster
//
//  Created by Yukui ye on 2/4/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import "HWTNode.h"

@implementation HWTNode

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

- (void)addChildNode:(HWTNode *)node {
    if (!self.children) {
        self.children = [NSMutableArray array];
    }
    [self.children addObject:node];
}
@end
