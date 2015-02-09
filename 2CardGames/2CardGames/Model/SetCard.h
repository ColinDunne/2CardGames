//
//  SetCard.h
//  2CardGames
//
//  Created by 钱辰 on 15/2/9.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic,strong) NSString *shape;
@property (nonatomic,strong) NSString *color;

+ (NSArray *)validShapes;
+ (NSArray *)validColors;

@end
