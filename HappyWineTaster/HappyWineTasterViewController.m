//
//  HappyWineTasterViewController.m
//  HappyWineTaster
//
//  Created by Yukui ye on 1/27/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import "HappyWineTasterViewController.h"
#import "DropBehavior.h"

@interface HappyWineTasterViewController ()<UIDynamicAnimatorDelegate>
@property (weak, nonatomic) IBOutlet UIView *rainView;
@property (strong, nonatomic)UIDynamicAnimator *animator;
@property (strong, nonatomic)DropBehavior *mydropBehavior;
@end

@implementation HappyWineTasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   // self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"grapevinecorner.jpg"]];
    
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

    [self.rainView addSubview:dropBtn];
    [self.mydropBehavior addItem:dropBtn];
    
}

- (UIColor *)randomColor {
    switch (arc4random()%5) {
        case 0 : return [UIColor greenColor];
        case 1 : return [UIColor blueColor];
        case 2 : return [UIColor orangeColor];
        case 3 : return [UIColor redColor];
        case 4 : return [UIColor purpleColor];
    }
    return [UIColor blackColor];
}

- (NSMutableAttributedString *)customAttString {
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setAlignment:NSTextAlignmentCenter];
    [style setLineBreakMode:NSLineBreakByWordWrapping];
    
    ////need to modify code try to make different attribute string which represent different wine BY using for loop ?
    
    UIFont *font1 = [UIFont fontWithName:@"Zapfino" size:10.0f];
    UIFont *font2 = [UIFont fontWithName:@"HelveticaNeue-Medium"  size:10.0f];
    
    NSDictionary *dict1 = @{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
                            NSFontAttributeName:font1};
    NSDictionary *dict2 = @{NSUnderlineStyleAttributeName:@(NSUnderlineStyleNone),
                            NSFontAttributeName:font2};
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] init];
    [attString appendAttributedString:[[NSAttributedString alloc] initWithString:@"Wine\n"    attributes:dict1]];
    [attString appendAttributedString:[[NSAttributedString alloc] initWithString:@"TASTER"      attributes:dict2]];
    
    
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, attString.length)];
    
    return attString;
}

@end
