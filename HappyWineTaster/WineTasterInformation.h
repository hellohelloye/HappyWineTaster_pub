//
//  WineTasterInformation.h
//  HappyWineTaster
//
//  Created by Yukui ye on 1/29/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WineTasterInformation : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *postion;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *tastingBeat;
@property (strong, nonatomic) NSString *introduction;

- (instancetype)initWithDictionary:(NSArray *)tasters;

@end
