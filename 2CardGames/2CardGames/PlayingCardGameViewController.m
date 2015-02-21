//
//  PlayingCardGameViewController.m
//  2CardGames
//
//  Created by 钱辰 on 15/2/12.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCardMatchingGame.h"

@interface PlayingCardGameViewController ()
@property (nonatomic,strong) PlayingCardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;
@end

@implementation PlayingCardGameViewController

- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (IBAction)startOver:(UIButton *)sender {
    [self startOver];
}

- (void)startOver {
    self.game = nil;
    [self updateUI];
}

- (void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld",(long)self.game.score];
    self.msgLabel.text = self.game.latestMessage;
}

- (NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

- (PlayingCardMatchingGame *)game {
    if (!_game) {
        _game = [[PlayingCardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    }
    return _game;
}

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

#pragma mark Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}

@end
