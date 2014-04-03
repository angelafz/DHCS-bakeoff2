//
//  ViewController.h
//  IZValueSelector
//
//  Created by Iman Zarrabian on 02/11/12.
//  Copyright (c) 2012 Iman Zarrabian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IZValueSelectorView.h"
@interface ViewController : UIViewController <IZValueSelectorViewDataSource,IZValueSelectorViewDelegate>

@property (nonatomic,weak) IBOutlet IZValueSelectorView *alphabet1;
@property (nonatomic,weak) IBOutlet IZValueSelectorView *alphabet2;
@property (nonatomic,weak) IBOutlet IZValueSelectorView *vowels;

@property (nonatomic, strong) NSArray *phrases;
@property (nonatomic, strong) UILabel *phrase;
@property (nonatomic, strong) UILabel *input;
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) UIButton *restartButton;
@property (nonatomic, strong) UIButton *spacebar;
@property (nonatomic, strong) UIButton *backspace;
@property (nonatomic, strong) UIButton *alph1Button;
@property (nonatomic, strong) UIButton *alph2Button;
@property (nonatomic, strong) UIButton *vowelsButton;
@property (nonatomic, strong) UILabel *timeTaken;
@property (nonatomic, strong) UILabel *totalLetters;

@end
