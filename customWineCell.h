//
//  customWineCell.h
//  HappyWineTaster
//
//  Created by Yukui ye on 2/4/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customWineCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIButton *leftBtn;
@property (strong, nonatomic) IBOutlet UIButton *upRightBtn;
@property (strong, nonatomic) IBOutlet UIButton *downRightBtn;
@property (strong, nonatomic) IBOutlet UIButton *littleBtn;

- (void)littleDancing;
@end
