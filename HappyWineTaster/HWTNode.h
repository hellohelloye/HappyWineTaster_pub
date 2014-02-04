//
//  HWTNode.h
//  HappyWineTaster
//
//  Created by Yukui ye on 2/4/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWTNode : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *children;
@property (weak, nonatomic) HWTNode *parentNode;

- (instancetype)initWithName:(NSString *)name;
- (void)addChildNode:(HWTNode *)node;

@end
