//
//  SetCardMatchingGame.m
//  2CardGames
//
//  Created by 钱辰 on 15/2/10.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

#import "SetCardMatchingGame.h"

@interface SetCardMatchingGame ()

@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards;
@property (nonatomic,strong,readwrite) NSString *latestMessage;

@end

@implementation SetCardMatchingGame

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
    SetCard *card = [self cardAtIndex:index];
    self.latestMessage = nil;
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            card.chosen = YES;
            
            // match against other two cards
            NSMutableArray *cardsToMatch = [[NSMutableArray alloc] initWithCapacity:2];
            // [self.cards removeObjectAtIndex:index];
            for (SetCard *otherCard in self.cards) {
                if (otherCard == card) {
                    [cardsToMatch addObject:otherCard];
                }
                
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [cardsToMatch addObject:otherCard];
                }
            }
            
            if ([cardsToMatch count] == 3) {
                int matchScore = [card match:cardsToMatch];
                
                // shapes and colors are a perfect match  or  don't match at all
                if (matchScore == 12 || matchScore == 0) {
                    self.score += MATCH_BONUS;
                    card.matched = YES;
                    ((SetCard *)cardsToMatch[0]).matched = YES;
                    ((SetCard *)cardsToMatch[1]).matched = YES;
                    
                    self.latestMessage = [NSString stringWithFormat:@"Matched %@ %@ %@ for %d points", card.contents,
                                          ((SetCard *)cardsToMatch[0]).contents, ((SetCard *)cardsToMatch[1]).contents, MATCH_BONUS];
                } else {
                    self.score -= MISMATCH_PENALTY;
                    ((SetCard *)cardsToMatch[0]).chosen = NO;
                    ((SetCard *)cardsToMatch[1]).chosen = NO;
                    
                    self.latestMessage = [NSString stringWithFormat:@"%@ %@ %@ don't match! %d points penalty!", card.contents,
                                          ((SetCard *)cardsToMatch[0]).contents, ((SetCard *)cardsToMatch[1]).contents, MISMATCH_PENALTY];
                }
                
            } else {
                //don't have enough cards or cards are too much, can't start to match
                self.latestMessage = card.contents;
                self.score -= COST_TO_CHOOSE;
            }
        }
    }
}

- (SetCard *)cardAtIndex:(NSUInteger)index {
    SetCard *card = nil;
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
