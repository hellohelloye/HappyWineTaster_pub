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
    
    customWineCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
//    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(cell.bigView.frame.origin.x, cell.bigView.frame.origin.y, cell.bigView.frame.size.width, cell.bigView.frame.size.height)];
//    myLabel.text = self.grapeTree.firstLayer[indexPath.row];
//    myLabel.textColor = [UIColor whiteColor];
//    myLabel.backgroundColor  = [UIColor blackColor];
//    
//    [cell.bigView addSubview:myLabel];
    
    cell.bigLabel.text = self.grapeTree.firstLayer[indexPath.row];
    cell.bigLabel.textColor = [UIColor whiteColor];
    cell.bigLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:10.0f];
    [cell.bigLabel setTextAlignment:NSTextAlignmentCenter];
    cell.backgroundColor = [UIColor clearColor];
    
    [cell littleDancing];
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}



@end
