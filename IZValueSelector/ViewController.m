//
//  ViewController.m
//  IZValueSelector
//
//  Created by Iman Zarrabian on 02/11/12.
//  Copyright (c) 2012 Iman Zarrabian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,assign) BOOL wantHorizontal;
@end

@implementation ViewController
@synthesize selectorHorizontal = _selectorHorizontal;
@synthesize vowels = _vowels;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.wantHorizontal = YES;
    
    self.selectorHorizontal.dataSource = self;
    self.selectorHorizontal.delegate = self;
    self.selectorHorizontal.shouldBeTransparent = YES;
    self.selectorHorizontal.horizontalScrolling = YES;
    
    self.vowels.dataSource = self;
    self.vowels.delegate = self;
    self.vowels.shouldBeTransparent = YES;
    self.vowels.horizontalScrolling = YES;
    
    //You can toggle Debug mode on selectors to see the layout
    self.selectorHorizontal.debugEnabled = NO;
    
    [[self selectorHorizontal] setDecelerates:NO];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma IZValueSelector dataSource
- (NSInteger)numberOfRowsInSelector:(IZValueSelectorView *)valueSelector {
    if (valueSelector == self.selectorHorizontal) {
        return 27;
    }
    return 6;
}

//ONLY ONE OF THESE WILL GET CALLED (DEPENDING ON the horizontalScrolling property Value)
- (CGFloat)rowHeightInSelector:(IZValueSelectorView *)valueSelector {
    return 70.0;
}

- (CGFloat)rowWidthInSelector:(IZValueSelectorView *)valueSelector {
    return 70.0;
}

- (UIView *)selector:(IZValueSelectorView *)valueSelector viewForRowAtIndex:(NSInteger)index
{
    return [self selector:valueSelector viewForRowAtIndex:index selected:NO];
}

- (UIView *)selector:(IZValueSelectorView *)valueSelector viewForRowAtIndex:(NSInteger)index selected:(BOOL)selected {
    UILabel * label = nil;
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, self.selectorHorizontal.frame.size.height)];
    NSArray *alphabet = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M",
                          @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", @" "];
    if (valueSelector == self.vowels) {
        alphabet = @[@"A", @"E", @"I", @"O", @"U", @"Y"];
    }
    label.text = [alphabet objectAtIndex:index];
    label.textAlignment =  NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:50];
    label.backgroundColor = [UIColor clearColor];
    if (selected) {
        label.textColor = [UIColor redColor];
    } else {
        label.textColor = [UIColor blackColor];
    }
    return label;
}

- (CGRect)rectForSelectionInSelector:(IZValueSelectorView *)valueSelector {
    return CGRectMake(self.selectorHorizontal.frame.size.width/2 - 35.0, 0.0, 70.0, 90.0);

}

#pragma IZValueSelector delegate
- (void)selector:(IZValueSelectorView *)valueSelector didSelectRowAtIndex:(NSInteger)index {
    NSLog(@"Selected index %d",index);
}


@end
