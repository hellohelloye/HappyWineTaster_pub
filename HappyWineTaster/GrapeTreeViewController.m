//
//  GrapeTreeViewController.m
//  HappyWineTaster
//
//  Created by Yukui ye on 1/29/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import "GrapeTreeViewController.h"
#import "DataGenerator.h"
#import "GrapeTreeInformation.h"
#import "customWineCell.h"

@interface GrapeTreeViewController ()
@property(strong, nonatomic)GrapeTreeInformation *grapeTree;
@end

@implementation GrapeTreeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    self.grapeTree = [[DataGenerator alloc]grapeTreeInformationGenerator];

    self.grapeTableView.delegate = self;
    self.grapeTableView.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.grapeTree.firstLayer count];;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"customWineCell";
    
    NSMutableArray *helperArray = [self.grapeTree.childLayer copy];
    
    customWineCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.leftBtn.titleLabel.text = self.grapeTree.firstLayer[indexPath.row];

    [helperArray enumerateObjectsUsingBlock:^(HWTNode *obj, NSUInteger idx, BOOL *stop) {
        if (idx > 0) {
            if ([obj.name  isEqual: @"line"]) {
                stop = YES;
            } else {
                [helperArray delete:obj];
            }
        }
    }];
    cell.upRightBtn.titleLabel.text = helperArray[0];
    cell.downRightBtn.titleLabel.text = helperArray[1];
    
        
    return cell;
    
}



@end
