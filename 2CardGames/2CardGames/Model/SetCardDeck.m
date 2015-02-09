//
//  SetCardDeck.m
//  2CardGames
//
//  Created by 钱辰 on 15/2/9.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (instancetype)init {
    self = [super init];
    
    if (self) {
        for (NSString *shape in [SetCard validShapes]) {
            for (NSString *color in [SetCard validColors]) {
                SetCard * card = [[SetCard alloc] init];
                card.shape = shape;
                card.color = color;
                [self addCard:card];
            }
        }
    }
    
    return self;
}

@end
