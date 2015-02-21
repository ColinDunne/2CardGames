//
//  MatchingLogViewController.m
//  2CardGames
//
//  Created by 钱辰 on 15/2/21.
//  Copyright (c) 2015年 qianchen. All rights reserved.
//

#import "MatchingLogViewController.h"

@interface MatchingLogViewController ()
@property (weak, nonatomic) IBOutlet UITextView *logView;
@end

@implementation MatchingLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateUI];
}

- (void)updateUI {
    self.logView.text = self.matchingLog;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
