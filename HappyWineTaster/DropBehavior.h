//
//  DropBehavior.h
//  HappyWineTaster
//
//  Created by Yukui ye on 1/28/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropBehavior : UIDynamicBehavior

- (void)addItem:(id<UIDynamicItem>)item;
- (void)removeItem:(id<UIDynamicItem>)item;

@end
