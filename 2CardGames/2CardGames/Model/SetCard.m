//
//  SetCard.m
//  2CardGames
//
//  Created by 钱辰 on 15/2/9.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    for (int i = 0; i < [otherCards count]; i++) {
        for (int j = i + 1; j < [otherCards count]; j++) {
            SetCard *cardOne = [otherCards objectAtIndex:i];
            SetCard *cardTwo = [otherCards objectAtIndex:j];
            if ([cardOne.shape isEqualToString:cardTwo.shape] && [cardOne.color isEqualToString:cardTwo.color]) {
                score += 4;
            } else if (![cardOne.shape isEqualToString:cardTwo.shape] && ![cardOne.color isEqualToString:cardTwo.color]) {
                score += 0;
            } else {
                score += 1;
            }
        }
    }
    
    return score;
}

- (NSString *)contents {
    return [self.color stringByAppendingString:self.shape];
}

- (void)setShape:(NSString *)shape {
    if ([[SetCard validShapes] containsObject:shape]) {
        _shape = shape;
    }
}

- (void)setColor:(NSString *)color {
    if ([[SetCard validColors] containsObject:color]) {
        _color = color;
    }
}

+ (NSArray *)validShapes {
    return @[@"●",@"◼︎",@"◆",@"▲",@"▶︎",@"◀︎",@"▼",@"★"];
}

+ (NSArray *)validColors {
    return  @[@"Red",@"Yellow",@"Blue",@"Orange",@"Purple",@"Green",@"Gray",@"Black"];
}

@end
