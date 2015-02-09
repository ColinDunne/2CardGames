//
//  PlayingCard.h
//  2CardGames
//
//  Created by 钱辰 on 15/2/9.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
