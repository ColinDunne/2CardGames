//
//  GameViewController.h
//  2CardGames
//
//  Created by 钱辰 on 15/2/10.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

// Abstract class.

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface GameViewController : UIViewController

// for subclasses
- (Deck *)createDeck; // abstract

@end
