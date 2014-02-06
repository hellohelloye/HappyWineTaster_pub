//
//  customWineCell.m
//  HappyWineTaster
//
//  Created by Yukui ye on 2/4/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import "customWineCell.h"

@implementation customWineCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
 

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)littleDancing {
    
    self.leftBtn.clipsToBounds = YES;
    self.leftBtn.layer.cornerRadius = self.leftBtn.frame.size.width/2;
    self.leftBtn.backgroundColor = [UIColor redColor];
    self.leftBtn.titleLabel.textColor = [UIColor whiteColor];
    [self.leftBtn.titleLabel setAutoresizesSubviews:YES];
    
    
    self.upRightBtn.clipsToBounds = YES;
    self.upRightBtn.layer.cornerRadius = self.upRightBtn.frame.size.width/2;
    self.upRightBtn.backgroundColor = [UIColor redColor];
    
    self.downRightBtn.clipsToBounds = YES;
    self.downRightBtn.layer.cornerRadius = self.downRightBtn.frame.size.width/2;
    self.downRightBtn.backgroundColor = [UIColor redColor];
    
    self.littleBtn.clipsToBounds = YES;
    self.littleBtn.layer.cornerRadius = self.downRightBtn.frame.size.width/2;
    self.littleBtn.backgroundColor = [UIColor redColor];
    
    [UIView animateWithDuration:5
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.leftBtn.transform = CGAffineTransformRotate(CGAffineTransformScale(self.leftBtn.transform, 1, 1), M_PI/2);
                     }completion:^(BOOL finished){
                         if (finished) {
                             [UIView animateWithDuration:1
                                                   delay:0
                                                 options:UIViewAnimationOptionCurveLinear
                                              animations:^{
                                                  self.leftBtn.transform = CGAffineTransformRotate(CGAffineTransformScale(self.leftBtn.transform, 0.7, 0.7), -M_PI/2);
                                              }completion:^(BOOL finished){
                                                  if (finished) {
                                                      [UIView animateWithDuration:1
                                                                            delay:0
                                                                          options:UIViewAnimationOptionCurveLinear
                                                                       animations:^{
                                                                           self.leftBtn.transform = CGAffineTransformRotate(CGAffineTransformScale(self.leftBtn.transform, 1, 1), M_PI/2);
                                                                       }completion:^(BOOL finished){
                                                                           if (finished) {
                                                                               [UIView animateWithDuration:1
                                                                                                     delay:0
                                                                                                   options:UIViewAnimationOptionCurveLinear
                                                                                                animations:^{
                                                                                                    self.leftBtn.transform = CGAffineTransformRotate(CGAffineTransformScale(self.leftBtn.transform, 0.7, 0.7), -M_PI/2);
                                                                                                }completion:^(BOOL finished){
                                                                                                    self.leftBtn.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                                                                                                }];
                                                                           }
                                                                       }];
                                                      
                                                  }
                                              }];
                         }
                         
                     }];
    
    
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionTransitionFlipFromBottom
                     animations:^{
                         self.upRightBtn.transform = CGAffineTransformRotate(CGAffineTransformScale(self.upRightBtn.transform, 1, 1), -2*M_PI/3);
                         self.littleBtn.transform =  CGAffineTransformScale(CGAffineTransformIdentity, 0, 0);
                         self.downRightBtn.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
                     }completion:^(BOOL finished){
                         if (finished) {
                             [UIView animateWithDuration:5 delay:0 options:UIViewAnimationOptionTransitionFlipFromBottom
                                              animations:^{
                                                  self.upRightBtn.transform = CGAffineTransformRotate(CGAffineTransformScale(self.upRightBtn.transform, 0.7, 0.7), 2*M_PI/3);
                                                  self.littleBtn.transform = CGAffineTransformRotate(CGAffineTransformScale(self.upRightBtn.transform, 0.5, 0.5), M_PI);
                                                  self.downRightBtn.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.7, 0.7);
                                                  
                                              }completion:^(BOOL finished){
                                                  if (finished) {
                                                      [UIView animateWithDuration:5 delay:0 options:UIViewAnimationCurveEaseOut animations:^{
                                                          self.upRightBtn.transform = CGAffineTransformRotate(CGAffineTransformScale(self.upRightBtn.transform, 0.5, 0.5), M_PI);
                                                          self.littleBtn.transform = CGAffineTransformRotate(CGAffineTransformScale(self.upRightBtn.transform, 0.7, 0.7), 2*M_PI/3);
                                                          self.downRightBtn.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
                                                      }completion:^(BOOL finished){
                                                          if (finished) {
                                                              self.upRightBtn.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
                                                              self.littleBtn.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                                                              self.downRightBtn.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.6, 0.6);
                                                          }
                                                      }];
                                                  }
                                              }];
                         }
                     }];
}

@end
