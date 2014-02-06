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
#import "DetailGrapeTreeViewController.h"

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
    
//    UIImage *myImage = [self scaleImage:[UIImage imageNamed:@"splitWine"] toSize:self.view.frame.size];
//    self.grapeTableView.backgroundColor = [UIColor colorWithPatternImage:myImage];
    self.grapeTableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"splitWine"]];
    
  //  self.navigationController.navigationBar.hidden = YES;
    self.grapeTableView.separatorColor = [UIColor clearColor];
    
}

- (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndPDFContext();
    
    return newImage;
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
    cell.leftBtn.titleLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    
    [cell littleDancing];
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}



@end
