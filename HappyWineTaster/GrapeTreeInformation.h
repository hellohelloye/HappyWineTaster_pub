//
//  GrapeTreeInformation.h
//  HappyWineTaster
//
//  Created by Yukui ye on 2/3/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HWTNode.h"

@interface GrapeTreeInformation : NSObject

@property (strong, nonatomic)NSArray *firstLayer;
@property (strong, nonatomic)NSArray *childLayer;


@property (strong, nonatomic)NSArray *redWineFirstChild;
@property (strong, nonatomic)NSArray *redWineFruityChild;
@property (strong, nonatomic)NSArray *redWineSavoryChild;

@property (strong, nonatomic)NSArray *whiteWineFirstChild;
@property (strong, nonatomic)NSArray *roseWineFirstChild;
@property (strong, nonatomic)NSArray *sparklingWineFirstChild;
@property (strong, nonatomic)NSArray *fortifiedWineFirstChild;


+ (id)GrapeTreeInformationFromNode:(HWTNode *)rootNode;


/*
//Red wine collection
@property(strong, nonatomic) NSDictionary *redWines;
@property(strong, nonatomic) NSDictionary *savoryRed;
@property(strong, nonatomic) NSDictionary *sClayCuredMeats;
@property(strong, nonatomic) NSArray *sccmHighTannin;
@property(strong, nonatomic) NSArray *sccmRound;
@property(strong, nonatomic) NSDictionary *sTruffleForest;
@property(strong, nonatomic) NSArray *stfRound;
@property(strong, nonatomic) NSArray *stfSpicy;
@property(strong, nonatomic) NSDictionary *sSmokeTobaccoLeather;
@property(strong, nonatomic) NSArray *sstlHighTannin;
@property(strong, nonatomic) NSArray *sstlRound;
@property(strong, nonatomic) NSDictionary *sBlackPepperGravel;
@property(strong, nonatomic) NSArray *sbpgRound;
@property(strong, nonatomic) NSArray *sbpgSpicy;
@property(strong, nonatomic) NSArray *sbpgHighTannin;

@property(strong, nonatomic) NSDictionary *fruityRed;
@property(strong, nonatomic) NSDictionary *fBlueberryBlackberry;
@property(strong, nonatomic) NSArray *fbbHighTannin;
@property(strong, nonatomic) NSArray *fbbRound;
@property(strong, nonatomic) NSArray *fbbSpicy;
@property(strong, nonatomic) NSDictionary *fBlackCherryRaspberry;
@property(strong, nonatomic) NSArray *fbcrHighTannin;
@property(strong, nonatomic) NSArray *fbcrRound;
@property(strong, nonatomic) NSArray *fbcrSpicy;
@property(strong, nonatomic) NSDictionary *fStarwberryCherry;
@property(strong, nonatomic) NSArray *fsbcSpicy;
@property(strong, nonatomic) NSArray *fsbcRound;
@property(strong, nonatomic) NSDictionary *fTartCherryCranberry;
@property(strong, nonatomic) NSArray *ftccSpicy;
@property(strong, nonatomic) NSArray *ftccRound;

//@property(strong, nonatomic) NSString *sweetRed;

//White Wine collection
@property(strong, nonatomic) NSDictionary *whiteWines;
@property(strong, nonatomic) NSDictionary *dryWhite;
@property(strong, nonatomic) NSArray *dwLightGrapeFruitFloral;
@property(strong, nonatomic) NSArray *dwLightCitrusLemon;
@property(strong, nonatomic) NSArray *dwLightHerbalGrassy;
@property(strong, nonatomic) NSArray *dwRichCreamyNutty;
@property(strong, nonatomic) NSArray *dwMediumPerfumeFloral;

@property(strong, nonatomic) NSDictionary *sweetWhite;
@property(strong, nonatomic) NSArray *swRichTropicalHoney;
@property(strong, nonatomic) NSArray *swOffDryApricotsPeaches;

//Rose Collection
@property(strong, nonatomic) NSDictionary *roseWines;
@property(strong, nonatomic) NSArray *semiSweetRose;
@property(strong, nonatomic) NSDictionary *dryRose;
@property(strong, nonatomic) NSArray *drSavory;
@property(strong, nonatomic) NSArray *drFruity;

//Sparkling wine collection
@property(strong, nonatomic) NSDictionary *sparklingWines;
@property(strong, nonatomic) NSDictionary *whiteSparklingWine;
@property(strong, nonatomic) NSArray *wswDryCreamyRich;
@property(strong, nonatomic) NSArray *wswDryLightCitrus;
@property(strong, nonatomic) NSArray *wswSemiSweetFloral;
@property(strong, nonatomic) NSArray *wswSweetApricotsRich;
@property(strong, nonatomic) NSDictionary *redSparklingWine;
@property(strong, nonatomic) NSArray *rswDryRaspberryBlueberry;
@property(strong, nonatomic) NSArray *rswSweetBlueberryCherry;
@property(strong, nonatomic) NSArray *rswSemiSweetRaspberryCherry;
@property(strong, nonatomic) NSDictionary *roseSparklingWine;
@property(strong, nonatomic) NSArray *roseswDryStrawberryLight;
@property(strong, nonatomic) NSArray *roseswSemiSweetStrawberryOrange;

//Fortified wine collection
@property(strong, nonatomic) NSDictionary *fortifiedWines;
@property(strong, nonatomic) NSArray *redFortified;
@property(strong, nonatomic) NSArray *whiteFortified;
@property(strong, nonatomic) NSDictionary *nuttyFortified;
@property(strong, nonatomic) NSArray *nfSweet;
@property(strong, nonatomic) NSArray *nfDry;
*/
@end
