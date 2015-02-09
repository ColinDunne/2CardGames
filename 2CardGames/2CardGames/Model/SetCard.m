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
    
    for (SetCard *otherCard in otherCards) {
        if ([self.shape isEqualToString:otherCard.shape] && [self.color isEqualToString:otherCard.color]) {
            score += 2;
        } else if ([self.shape isEqualToString:otherCard.shape] || [self.color isEqualToString:otherCard.color]) {
            score += 1;
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
    return  @[@"Red",@"Yellow",@"Blue",@"Orange",@"Purple",@"Grean",@"Grey",@"Black"];
}

@end
