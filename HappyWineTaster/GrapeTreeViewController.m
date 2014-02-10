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
#import "Utility.h"

@interface GrapeTreeViewController ()
@property(strong, nonatomic)GrapeTreeInformation *grapeTree;
@property(strong, nonatomic)DetailGrapeTreeViewController *dgtvc;
@end

@implementation GrapeTreeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    self.grapeTree = [[DataGenerator alloc]grapeTreeInformationGenerator];

    self.grapeTableView.delegate = self;
    self.grapeTableView.dataSource = self;
    
    self.grapeTableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"splitWine"]];
    
    //self.navigationController.navigationBar.hidden = YES;    
    
    self.grapeTableView.separatorColor = [UIColor clearColor];
    
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
    cell.bigLabel.font = [UIFont fontWithName:@"Zapfino" size:10.0f];
    [cell.bigLabel setTextAlignment:NSTextAlignmentCenter];
    cell.backgroundColor = [UIColor clearColor];
    
    [cell littleDancing];
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.dgtvc) {
        [self.dgtvc.view removeFromSuperview];
        self.dgtvc = NULL;
        
        
    }
    DetailGrapeTreeViewController *dg = [self.storyboard instantiateViewControllerWithIdentifier:@"detailGrapeTreeView"];
    self.dgtvc = dg;
    
    
    self.grapeTableView.frame = CGRectMake(0,0,self.view.frame.size.width,100);
    self.grapeTableView.clipsToBounds = YES;
    self.grapeTableView.layer.cornerRadius = self.grapeTableView.frame.size.width/2;
    
    
    self.dgtvc.view.frame = CGRectMake(self.view.frame.size.width/2, 0, self.view.frame.size.width/2, self.view.frame.size.height);
    self.dgtvc.view.frame = CGRectMake(0, self.view.frame.size.height-300, 300, 300);
    self.dgtvc.view.clipsToBounds = YES;
    self.dgtvc.view.layer.cornerRadius = self.dgtvc.view.frame.size.width/2;
    
    if ([self.grapeTree.firstLayer[indexPath.row]  isEqual: @"White"]) {
        self.dgtvc.view.backgroundColor = [UIColor colorWithPatternImage:[[Utility alloc] scaleImage:[UIImage imageNamed:@"WhiteWine2"] toSize:self.dgtvc.view.frame.size]];
    } else if ([self.grapeTree.firstLayer[indexPath.row]  isEqual: @"Sparkling Wine"]) {
        self.dgtvc.view.backgroundColor = [UIColor colorWithPatternImage:[[Utility alloc] scaleImage:[UIImage imageNamed:@"sparklingWine"] toSize:self.dgtvc.view.frame.size]];
    } else if ([self.grapeTree.firstLayer[indexPath.row]  isEqual: @"Rose"]) {
        self.dgtvc.view.backgroundColor = [UIColor colorWithPatternImage:[[Utility alloc] scaleImage:[UIImage imageNamed:@"rose3"] toSize:self.dgtvc.view.frame.size]];
    } else if ([self.grapeTree.firstLayer[indexPath.row]  isEqual: @"Fortified Wine"]) {
        self.dgtvc.view.backgroundColor = [UIColor colorWithPatternImage:[[Utility alloc] scaleImage:[UIImage imageNamed:@"FortifiedWine"] toSize:self.dgtvc.view.frame.size]];
    } else if ([self.grapeTree.firstLayer[indexPath.row]  isEqual: @"Red"]) {
        self.dgtvc.view.backgroundColor = [UIColor colorWithPatternImage:[[Utility alloc] scaleImage:[UIImage imageNamed:@"redWine"] toSize:self.dgtvc.view.frame.size]];
    }
    
    
    
    
//    [UIView animateWithDuration:2
//                     animations:^{
//                         
//                               dgtvc.view.transform = CGAffineTransformRotate(CGAffineTransformScale(dgtvc.view.transform, 1, 1), M_PI/3);
//                         self.grapeTableView.transform = CGAffineTransformRotate(CGAffineTransformScale(self.grapeTableView.transform, 1, 1), -M_PI/4);
//                         
//                        
//                              }completion:^(BOOL finished){
//                                  
//                                  if (finished) {
//                                      
//                                      
//                                      dgtvc.view.transform = CGAffineTransformRotate(CGAffineTransformScale(dgtvc.view.transform, 1, 1), -M_PI/3);
//                                      
//                                      
//                                      [self.view addSubview:dgtvc.view];
//                                      [self addChildViewController:dgtvc];
//
//                                  }
//                                  
//     }];
//
    
    [self.view addSubview:self.dgtvc.view];
    [self addChildViewController:self.dgtvc];
    
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionTransitionFlipFromBottom
                     animations:^{
                         self.grapeTableView.transform = CGAffineTransformRotate(CGAffineTransformScale(self.grapeTableView.transform, 0.7, 0.7), 1);
                         self.dgtvc.view.transform = CGAffineTransformRotate(CGAffineTransformScale(self.grapeTableView.transform, 0.5, 0.5), 1);
                        
                     }completion:^(BOOL finished){
                         if (finished) {
                             [UIView animateWithDuration:1
                                              animations:^{
                                                  self.grapeTableView.transform = CGAffineTransformRotate(CGAffineTransformScale(self.grapeTableView.transform, 1, 1),1);
                                                  self.dgtvc.view.transform = CGAffineTransformRotate(CGAffineTransformScale(self.grapeTableView.transform, 1, 1),1);
                                              }];
                         }
                     }];

    
    
}



@end
