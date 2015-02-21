//
//  PlayingCardMatchingGame.m
//  2CardGames
//
//  Created by 钱辰 on 15/2/10.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

#import "PlayingCardMatchingGame.h"

@interface PlayingCardMatchingGame ()

@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards;
@property (nonatomic,strong,readwrite) NSString *latestMessage;

@end

@implementation PlayingCardMatchingGame

static const int MATCH_BONUS = 4;
static const int MISMATCH_PENALTY = 2;
static const int COST_TO_CHOOSE = 1;

- (instancetype)init {
    return nil;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    self.latestMessage = nil;
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // match against another card
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                        
                        self.latestMessage = [NSString stringWithFormat:@"Matched %@ %@ for %d points",
                                              card.contents, otherCard.contents, matchScore * MATCH_BONUS];
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                        
                        self.latestMessage = [NSString stringWithFormat:@"%@ %@ don't match! %d points penalty!",
                                              card.contents, otherCard.contents, MISMATCH_PENALTY];
                    }
                    break;
                }
            }
            
            if (!self.latestMessage) {
                self.score -= COST_TO_CHOOSE;
                self.latestMessage = card.contents;
            }
            
            card.chosen = YES;
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index {
    Card *card = nil;
    if (index < [self.cards count]) {
        card = [self.cards objectAtIndex:index];
    }
    return card;
}

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

@end
