//
//  PlayingCardMatchingGame.h
//  2CardGames
//
//  Created by 钱辰 on 15/2/10.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface PlayingCardMatchingGame : NSObject

@property (nonatomic,readonly) NSInteger score;

@property (nonatomic,strong,readonly) NSString *latestMessage;


- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@end
