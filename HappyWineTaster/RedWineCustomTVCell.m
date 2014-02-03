//
//  RedWineCustomTVCell.m
//  HappyWineTaster
//
//  Created by Yukui ye on 2/3/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import "RedWineCustomTVCell.h"

@implementation RedWineCustomTVCell



static const CGSize BIG_SIZE = {80,80};
static const CGSize SMALL_SIZE = {40,40};

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        CGRect frameBig,frameSmall;
        frameBig.origin = CGPointZero;
        frameBig.size = BIG_SIZE;
        frameSmall.origin = CGPointZero;
        frameSmall.size = SMALL_SIZE;
        
        self.redBtn = [[UIButton alloc]initWithFrame:frameBig];
        self.fruityRedBtn = [[UIButton alloc]initWithFrame:frameSmall];
        self.savoryRedBtn = [[UIButton alloc]initWithFrame:frameSmall];
        
        
        self.redBtn.clipsToBounds = YES;
        self.fruityRedBtn.clipsToBounds = YES;
        self.savoryRedBtn.clipsToBounds = YES;
        
        self.redBtn.layer.cornerRadius = self.redBtn.frame.size.width/2;
        self.fruityRedBtn.layer.cornerRadius = self.fruityRedBtn.frame.size.width/2;
        self.savoryRedBtn.layer.cornerRadius = self.savoryRedBtn.frame.size.width/2;
        
        self.redBtn.backgroundColor = [UIColor redColor];
        self.fruityRedBtn.backgroundColor = [UIColor redColor];
        self.savoryRedBtn.backgroundColor = [UIColor redColor];
        
        
        [self.contentView addSubview:self.redBtn];
        [self.contentView addSubview:self.fruityRedBtn];
        [self.contentView addSubview:self.savoryRedBtn];
        
        
    }
    return self;
}


- (void)updateConstraints {
    ////////////////////////// constraints constraints constraints need need need
    
    
    
    
    
    
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
