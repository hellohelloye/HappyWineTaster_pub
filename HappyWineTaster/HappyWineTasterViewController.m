//
//  HappyWineTasterViewController.m
//  HappyWineTaster
//
//  Created by Yukui ye on 1/27/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import "HappyWineTasterViewController.h"
#import "DropBehavior.h"
#import "WineTasterInformation.h"

@interface HappyWineTasterViewController ()<UIDynamicAnimatorDelegate>
@property (weak, nonatomic) IBOutlet UIView *rainView;
@property (strong, nonatomic)UIDynamicAnimator *animator;
@property (strong, nonatomic)DropBehavior *mydropBehavior;
@property (strong, nonatomic) IBOutlet UINavigationItem *navItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *navLeftBtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *navRightBtn;
@property (strong, nonatomic) WineTasterInformation *wineTasterInfor;
@property (strong, nonatomic, readwrite) NSArray *tasters;   ///array for fill in red bubles and pass to FindMeVC
@end

@implementation HappyWineTasterViewController

- (void)awakeFromNib {
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSURL *wineTasterURL = [mainBundle URLForResource:@"WineTasterInformation" withExtension:@"plist"];
    
    self.tasters = [NSDictionary dictionaryWithContentsOfURL:wineTasterURL];
    
    ////////////////Connect to model
    
    
    
    ///////////////////////
    
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor yellowColor];
    shadow.shadowOffset = CGSizeMake(1, 0);
    
    [self.navLeftBtn setTitleTextAttributes:@{
                                             NSForegroundColorAttributeName: [UIColor redColor],
                                             NSShadowAttributeName:shadow,
                                             NSShadowAttributeName:shadow,
                                             NSFontAttributeName:[UIFont fontWithName:@"Zapfino" size:10.0f]
                                             }
                                   forState:UIControlStateNormal];
    
    [self.navRightBtn setTitleTextAttributes:@{
                                               NSForegroundColorAttributeName: [UIColor redColor],
                                               NSShadowAttributeName:shadow,
                                               NSShadowAttributeName:shadow,
                                               NSFontAttributeName:[UIFont fontWithName:@"Zapfino" size:10.0f]
                                               }
                                   forState:UIControlStateNormal];

    
}

- (void)viewWillAppear:(BOOL)animated {
    // self.view.backgroundColor = [UIColor colorWithRed:173./255 green:234./255 blue:234./255 alpha:1.0];
    // self.navigationController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"grapvinecorner.png"]];
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"grapvinecorner.png"]];
    // self.navItem.titleView.backgroundColor = [UIColor colorWithRed:255./255 green:222./255 blue:223./255 alpha:1.0];
     self.view.backgroundColor = [UIColor colorWithRed:255./255 green:222./255 blue:223./255 alpha:1.0];
}

- (void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator {
    [self removeCompletedRows];
}

- (BOOL)removeCompletedRows {
    
    NSMutableArray *dropsToRemove = [[NSMutableArray alloc]init];
    
    for (CGFloat y = self.rainView.bounds.size.height - DROP_SIZE.height/2;y>0;y -= DROP_SIZE.height)
    {
        BOOL rowIsComplete = YES;
        NSMutableArray *dropsFound = [[NSMutableArray alloc]init];
        for (CGFloat x= DROP_SIZE.width/2; x <= self.rainView.bounds.size.width-DROP_SIZE.width/2;  x+= DROP_SIZE.width)
        {
            UIView *hitView = [self.rainView hitTest:CGPointMake(x, y) withEvent:NULL];
            if ([hitView superview] == self.rainView)
            {
                [dropsFound addObject:hitView];
            } else {
                rowIsComplete = NO;
                break;
            }
        }
        if (![dropsFound count]) break;
        if (rowIsComplete) [dropsToRemove addObjectsFromArray:dropsFound];
    }
    
    if ([dropsToRemove count]) {
        for (UIView *drop in dropsToRemove) {
            [self.mydropBehavior removeItem:drop];
        }
        [self animateRemovingDrops:dropsToRemove];
    }
    return NO;
}

- (void)animateRemovingDrops:(NSArray *)dropsToRemove {
    [UIView animateWithDuration:1.0
                     animations:^{
                         for (UIView *drop in dropsToRemove) {
                             //only left the red color bubles
                             if (drop.backgroundColor != [UIColor redColor])
                             {
                                 int x = (arc4random()%(int)(self.rainView.bounds.size.width*5)) - (int)self.rainView.bounds.size.width*2;
                                 int y = self.rainView.bounds.size.height;
                                 drop.center = CGPointMake(x, -y);

                             }
                        }
                     }
                     completion:^(BOOL finished){
                         for (UIView *drop in dropsToRemove) {
                             //only left the red color bubles
                             if (drop.backgroundColor != [UIColor redColor])
                             {
                                 //[dropsToRemove makeObjectsPerformSelector:@selector(removeObject:drop:)];
                             } else {
                                 [UIView animateWithDuration:1.0
                                                  animations:^{
                                                      drop.transform = CGAffineTransformRotate(CGAffineTransformScale(drop.transform, 1, 1), M_PI/2);
                                                  }
                                                  completion:^(BOOL finished){
                                                      if (finished) {
                                                          [UIView animateWithDuration:1
                                                                                delay:0
                                                                              options:UIViewAnimationOptionCurveLinear
                                                                           animations:^{
                                                                               drop.transform = CGAffineTransformRotate(CGAffineTransformScale(drop.transform, 0.7, 0.7), -M_PI/2);
                                                                           }completion:^(BOOL finished){
                                                                               if (finished) {
                                                                                   [UIView animateWithDuration:1
                                                                                                         delay:0
                                                                                                       options:UIViewAnimationOptionCurveLinear
                                                                                                    animations:^{
                                                                                                        drop.transform = CGAffineTransformRotate(CGAffineTransformScale(drop.transform, 1, 1), M_PI/2);
                                                                                                    }completion:^(BOOL finished){
                                                                                                        if (finished) {
                                                                                                            [UIView animateWithDuration:1
                                                                                                                                  delay:0
                                                                                                                                options:UIViewAnimationOptionCurveLinear
                                                                                                                             animations:^{
                                                                                                                                 drop.transform = CGAffineTransformRotate(CGAffineTransformScale(drop.transform, 0.7, 0.7), -M_PI/2);
                                                                                                                             }completion:^(BOOL finished){
                                                                                                                                 drop.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                                                                                                                             }];
                                                                                                        }
                                                                                                    }];
                                                                                   
                                                                               }
                                                                           }];

                                                      }
                                 }];
                             }
                         }

                        // [dropsToRemove makeObjectsPerformSelector:@selector(removeFromSuperview)];
                     }];
}

- (DropBehavior *)mydropBehavior {
    if (!_mydropBehavior) {
        _mydropBehavior = [[DropBehavior alloc]init];
        [self.animator addBehavior:_mydropBehavior];
    }
    return _mydropBehavior;
}

- (IBAction)tap:(UITapGestureRecognizer *)sender {
    
    [self startRain];
}


- (UIDynamicAnimator *)animator {
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.rainView];
        self.animator.delegate = self;
    }
    return _animator;
}


static const CGSize DROP_SIZE = {40,40};
- (void)startRain {
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = DROP_SIZE;
    
    int x = (arc4random()%(int)self.rainView.bounds.size.width)/DROP_SIZE.width;
    frame.origin.x = x*DROP_SIZE.width;
    
    UIButton *dropBtn = [[UIButton alloc]initWithFrame:frame];
    
    [dropBtn setAttributedTitle:[self customAttString] forState:UIControlStateNormal];
    dropBtn.backgroundColor = [self randomColor];
    
    dropBtn.clipsToBounds = YES;
    dropBtn.layer.cornerRadius = frame.size.width/2;
    if (dropBtn.backgroundColor == [UIColor redColor]) {
        dropBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        dropBtn.layer.borderWidth = 2.0f;
    }

    [self.rainView addSubview:dropBtn];
    [self.mydropBehavior addItem:dropBtn];
    
}

- (void)wineTasterContainer {
    
}

- (UIColor *)randomColor {
    switch (arc4random()%5) {
        case 0 : return [UIColor greenColor];
        case 1 : return [UIColor blueColor];
        case 2 : return [UIColor redColor];
        case 3 : return [UIColor yellowColor];
        case 4 : return [UIColor purpleColor];
    }
    return [UIColor blackColor];
}

- (NSMutableAttributedString *)customAttString {
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setAlignment:NSTextAlignmentCenter];
    [style setLineBreakMode:NSLineBreakByWordWrapping];
    
    ////need to modify code try to make different attribute string which represent different wine BY using for loop ?
    
    UIFont *font1 = [UIFont fontWithName:@"Zapfino" size:5.0f];
   // UIFont *font2 = [UIFont fontWithName:@"HelveticaNeue-Medium"  size:5.0f];
    
    NSDictionary *dict1 = @{NSUnderlineStyleAttributeName:@(NSUnderlineStyleNone),
                            NSFontAttributeName:font1};
   // NSDictionary *dict2 = @{NSUnderlineStyleAttributeName:@(NSUnderlineStyleNone),
                           // NSFontAttributeName:font2};
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] init];
    
    switch (arc4random()%5) {
        case 0 : {
            [attString appendAttributedString:[[NSAttributedString alloc] initWithString:@"RED\n"    attributes:dict1]];
          //  [attString appendAttributedString:[[NSAttributedString alloc] initWithString:@"Fruity|Savory"      attributes:dict2]];
        }
        case 1 : {
            [attString appendAttributedString:[[NSAttributedString alloc] initWithString:@"ROSE\n"    attributes:dict1]];
         //   [attString appendAttributedString:[[NSAttributedString alloc] initWithString:@"Semisweet|Dry"      attributes:dict2]];
        }
        case 2 : {
            [attString appendAttributedString:[[NSAttributedString alloc] initWithString:@"WHITE\n"    attributes:dict1]];
          //  [attString appendAttributedString:[[NSAttributedString alloc] initWithString:@"Dry|Sweet"      attributes:dict2]];
        }
        case 3 : {
            [attString appendAttributedString:[[NSAttributedString alloc] initWithString:@"SPARKLING\n"    attributes:dict1]];
          //  [attString appendAttributedString:[[NSAttributedString alloc] initWithString:@"White|Red|Rose"      attributes:dict2]];
        }
        case 4 : {
            [attString appendAttributedString:[[NSAttributedString alloc] initWithString:@"FORTIFIED\n"    attributes:dict1]];
          //  [attString appendAttributedString:[[NSAttributedString alloc] initWithString:@"Nutty|White|Red"      attributes:dict2]];
        }
    }
    
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, attString.length)];
    
    return attString;
}

@end
