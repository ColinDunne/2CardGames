//
//  SetCardGameViewController.m
//  2CardGames
//
//  Created by 钱辰 on 15/2/12.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCard.h"
#import "SetCardDeck.h"
#import "SetCardMatchingGame.h"

@interface SetCardGameViewController ()

@property (nonatomic,strong) SetCardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;
@end

@implementation SetCardGameViewController

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
        SetCard *card = [self.game cardAtIndex:cardIndex];
        [cardButton setAttributedTitle:[self titleForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld",(long)self.game.score];
    self.msgLabel.text = self.game.latestMessage;
}

- (NSMutableAttributedString *)titleForCard:(SetCard *)card {
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:card.shape];
    [title addAttribute:NSForegroundColorAttributeName
                  value:[self foregroundColor:card.color]
                  range:NSMakeRange(0, 1)];
    return title;
}

- (UIColor *)foregroundColor:(NSString *)color {
    UIColor *foregroundColor = nil;
    
    if ([color isEqualToString:@"Red"]) {
        foregroundColor = [UIColor redColor];
    } else if ([color isEqualToString:@"Yellow"]) {
        foregroundColor = [UIColor yellowColor];
    } else if ([color isEqualToString:@"Blue"]) {
        foregroundColor = [UIColor blueColor];
    } else if ([color isEqualToString:@"Orange"]) {
        foregroundColor = [UIColor orangeColor];
    } else if ([color isEqualToString:@"Purple"]) {
        foregroundColor = [UIColor purpleColor];
    } else if ([color isEqualToString:@"Green"]) {
        foregroundColor = [UIColor greenColor];
    } else if ([color isEqualToString:@"Gray"]) {
        foregroundColor = [UIColor grayColor];
    } else if ([color isEqualToString:@"Black"]) {
        foregroundColor = [UIColor blackColor];
    }
    
    return foregroundColor;
}

- (SetCardMatchingGame *)game {
    if (!_game) {
        _game = [[SetCardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    }
    return _game;
}

- (Deck *)createDeck {
    return [[SetCardDeck alloc] init];
}

#pragma mark Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end
