//
//  GrapeTreeInformation.m
//  HappyWineTaster
//
//  Created by Yukui ye on 2/3/14.
//  Copyright (c) 2014 M.Shanken. All rights reserved.
//

#import "GrapeTreeInformation.h"

@implementation GrapeTreeInformation

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}


+ (id)GrapeTreeInformationFromNode:(HWTNode *)rootNode {
    
    GrapeTreeInformation *grapeTree = [[GrapeTreeInformation alloc] init];

    NSMutableArray *helperParent = [NSMutableArray array];
    NSMutableArray *helperChildren = [NSMutableArray array];
    
    [rootNode.children enumerateObjectsUsingBlock:^(HWTNode *obj, NSUInteger idx, BOOL *stop) {
        [helperParent addObject:obj.name];
        if (obj.children) {
            if (idx-1 >= 0) {
                [helperChildren addObject:@"line"];
                [obj.children enumerateObjectsUsingBlock:^(HWTNode *obj, NSUInteger idx, BOOL *stop) {
                    [helperChildren addObject:obj.name];
                }];
            }
            grapeTree.childLayer = [helperChildren copy];
        }
    }];
    grapeTree.firstLayer = [helperParent copy];

    return grapeTree;
}



/*
+ (id)GrapeTreeInformationFromDictionary:(NSDictionary *)inforDict {
    GrapeTreeInformation *grapeTree = [[GrapeTreeInformation alloc]init];
    
    //red
    grapeTree.redWines = [inforDict valueForKey:@"RED"];
    grapeTree.savoryRed = [grapeTree.redWines valueForKey:@"Savory Red"];
    grapeTree.sClayCuredMeats = [grapeTree.savoryRed valueForKey:@"Clay Cured Meats"];
    grapeTree.sccmHighTannin = [grapeTree.sClayCuredMeats valueForKey:@"High Tannin"];
    grapeTree.sccmRound = [grapeTree.sClayCuredMeats valueForKey:@"Round"];
    
    grapeTree.sTruffleForest = [grapeTree.savoryRed valueForKey:@"Truffle Forest"];
    grapeTree.stfRound = [grapeTree.sTruffleForest valueForKey:@"Round"];
    grapeTree.stfSpicy = [grapeTree.sTruffleForest valueForKey:@"Spicy/Juicy"];
    
    grapeTree.sSmokeTobaccoLeather = [grapeTree.savoryRed valueForKey:@"Smoke Tobacco Leather"];
    grapeTree.sstlHighTannin = [grapeTree.sSmokeTobaccoLeather valueForKey:@"High Tannin"];
    grapeTree.sstlRound = [grapeTree.sSmokeTobaccoLeather valueForKey:@"Round"];
    
    grapeTree.sBlackPepperGravel = [grapeTree.savoryRed valueForKey:@"Black Pepper Gravel"];
    grapeTree.sbpgHighTannin = [grapeTree.sBlackPepperGravel valueForKey:@"High Tannin"];
    grapeTree.sbpgRound = [grapeTree.sBlackPepperGravel valueForKey:@"Round"];
    grapeTree.sbpgSpicy = [grapeTree.sBlackPepperGravel valueForKey:@"Spicy/Juicy"];
    
    grapeTree.fruityRed = [grapeTree.redWines valueForKey:@"Fruity Red"];
    grapeTree.fBlueberryBlackberry = [grapeTree.fruityRed valueForKey:@"Blueberry Blackberry"];
    grapeTree.fbbHighTannin = [grapeTree.fBlueberryBlackberry valueForKey:@"High Tannin"];
    grapeTree.fbbRound = [grapeTree.fBlueberryBlackberry valueForKey:@"Round"];
    grapeTree.fbbSpicy = [grapeTree.fBlueberryBlackberry valueForKey:@"Spicy"];
    
    grapeTree.fBlackCherryRaspberry = [grapeTree.fruityRed valueForKey:@"Black Cherry Raspberry"];
    grapeTree.fbcrHighTannin = [grapeTree.fBlackCherryRaspberry valueForKey:@"High Tannin"];
    grapeTree.fbcrRound = [grapeTree.fBlackCherryRaspberry valueForKey:@"Round"];
    grapeTree.fbcrSpicy = [grapeTree.fBlackCherryRaspberry valueForKey:@"Spicy"];
    
    grapeTree.fStarwberryCherry = [grapeTree.fruityRed valueForKey:@"Strawberry Cherry"];
    grapeTree.fsbcRound = [grapeTree.fStarwberryCherry valueForKey:@"Round"];
    grapeTree.fsbcSpicy = [grapeTree.fStarwberryCherry valueForKey:@"Spicy"];
    
    grapeTree.fTartCherryCranberry = [grapeTree.fruityRed valueForKey:@"Tart Cherry Cranberry"];
    grapeTree.ftccRound = [grapeTree.fTartCherryCranberry valueForKey:@"Round"];
    grapeTree.ftccSpicy = [grapeTree.fTartCherryCranberry valueForKey:@"Spicy"];
    
    //white
    grapeTree.whiteWines = [inforDict valueForKey:@"WHITE"];
    grapeTree.dryWhite = [grapeTree.whiteWines valueForKey:@"Dry White"];
    grapeTree.dwLightGrapeFruitFloral = [grapeTree.dryWhite valueForKey:@"Light Grapefruit Floral"];
    grapeTree.dwLightCitrusLemon = [grapeTree.dryWhite valueForKey:@"Light Citrus Lemon"];
    grapeTree.dwLightHerbalGrassy = [grapeTree.dryWhite valueForKey:@"Light Herbal Grassy"];
    grapeTree.dwRichCreamyNutty = [grapeTree.dryWhite valueForKey:@"Rich Creamy Nutty"];
    grapeTree.dwMediumPerfumeFloral = [grapeTree.dryWhite valueForKey:@"Medium Perfume Floral"];
    
    grapeTree.sweetWhite = [grapeTree.whiteWines valueForKey:@"Sweet White"];
    grapeTree.swRichTropicalHoney = [grapeTree.sweetWhite valueForKey:@"Rich Tropical Honey"];
    grapeTree.swOffDryApricotsPeaches = [grapeTree.sweetWhite valueForKey:@"Off-Dry Apricots Peaches"];
    
    //rose
    grapeTree.roseWines = [inforDict valueForKey:@"ROSE"];
    grapeTree.semiSweetRose = [grapeTree.roseWines valueForKey:@"Semi-Sweet Rose"];
    grapeTree.dryRose = [grapeTree.roseWines valueForKey:@"Dry Rose"];
    grapeTree.drSavory = [grapeTree.dryRose valueForKey:@"Savory/Meaty"];
    grapeTree.drFruity = [grapeTree.dryRose valueForKey:@"Fruity/Floral"];
    
    //sparkling
    grapeTree.sparklingWines = [inforDict valueForKey:@"SPARKLING WINE"];
    grapeTree.whiteSparklingWine = [grapeTree.sparklingWines valueForKey:@"White Sparkling Wine"];
    grapeTree.wswDryCreamyRich = [grapeTree.whiteSparklingWine valueForKey:@"Dry Creamy Rich"];
    grapeTree.wswDryLightCitrus = [grapeTree.whiteSparklingWine valueForKey:@"Dry Light Citrus"];
    grapeTree.wswSemiSweetFloral = [grapeTree.whiteSparklingWine valueForKey:@"Semi-Sweet Floral"];
    grapeTree.wswSweetApricotsRich = [grapeTree.whiteSparklingWine valueForKey:@"Sweet Apricots Rich"];
    
    grapeTree.redSparklingWine = [grapeTree.sparklingWines valueForKey:@"Red Sparkling Wine"];
    grapeTree.rswDryRaspberryBlueberry = [grapeTree.redSparklingWine valueForKey:@"Dry Raspberry Blueberry"];
    grapeTree.rswSemiSweetRaspberryCherry = [grapeTree.redSparklingWine valueForKey:@"Semi-Sweet Rasberry Cherry"];
    grapeTree.rswSweetBlueberryCherry = [grapeTree.redSparklingWine valueForKey:@"Sweet Blueberry Cherry"];
    
    grapeTree.roseSparklingWine = [grapeTree.sparklingWines valueForKey:@"Rose Sparkling Wine"];
    grapeTree.rswDryRaspberryBlueberry = [grapeTree.roseSparklingWine valueForKey:@"Dry Strawberry Light"];
    grapeTree.rswSemiSweetRaspberryCherry = [grapeTree.roseSparklingWine valueForKey:@"Semi-Sweet Strawberry Orange"];
    
    //fortified
    grapeTree.fortifiedWines = [inforDict valueForKey:@"FORTIFIED WINE"];
    grapeTree.redFortified = [grapeTree.fortifiedWines valueForKey:@"Red Fortified"];
    grapeTree.whiteFortified = [grapeTree.fortifiedWines valueForKey:@"White Fortified"];
    grapeTree.nuttyFortified = [grapeTree.fortifiedWines valueForKey:@"Nutty Fortified"];
    grapeTree.nfDry = [grapeTree.nuttyFortified valueForKey:@"Dry(semi-sweet)"];
    grapeTree.nfSweet = [grapeTree.nuttyFortified valueForKey:@"Sweet"];
    
    
    return grapeTree;
}
 */

@end
