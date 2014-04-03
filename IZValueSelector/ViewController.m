//
//  ViewController.m
//  IZValueSelector
//
//  Created by Iman Zarrabian on 02/11/12.
//  Copyright (c) 2012 Iman Zarrabian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int pIndex;
    int errorsTotal;
    int lettersEntered;
    int tempIndex;
    int numTrials;
    CFTimeInterval startTime;
}
@end

@implementation ViewController
@synthesize alphabet1 = _alphabet1;
@synthesize alphabet2 = _alphabet2;
@synthesize vowels = _vowels;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // KEYBOARDS
    self.alphabet1.dataSource = self;
    self.alphabet1.delegate = self;
    self.alphabet1.shouldBeTransparent = YES;
    self.alphabet1.horizontalScrolling = NO;
    
    self.alphabet2.dataSource = self;
    self.alphabet2.delegate = self;
    self.alphabet2.shouldBeTransparent = YES;
    self.alphabet2.horizontalScrolling = NO;
    
    self.vowels.dataSource = self;
    self.vowels.delegate = self;
    self.vowels.shouldBeTransparent = YES;
    self.vowels.horizontalScrolling = NO;
    
    self.phrases = @[@"my watch fell in the water", @"prevailing wind from the east", @"never too rich and never too thin", @"breathing is difficult", @"i can see the rings on saturn", @"physics and chemistry are hard", @"my bank account is overdrawn", @"elections bring out the best", @"we are having spaghetti", @"time to go shopping", @"a problem with the engine", @"elephants are afraid of mice", @"my favorite place to visit", @"three two one zero blast off", @"my favorite subject is psychology", @"circumstances are unacceptable", @"watch out for low flying objects", @"if at first you do not succeed", @"please provide your date of birth", @"we run the risk of failure", @"prayer in schools offends some", @"he is just like everyone else", @"great disturbance in the force", @"love means many things", @"you must be getting old", @"the world is a stage", @"can i skate with sister today", @"neither a borrower nor a lender be", @"one heck of a question", @"an excellent way to communicate", @"with each step forward", @"faster than a speeding bullet", @"wishful thinking is fine", @"nothing wrong with his style", @"arguing with the boss is futile", @"taking the train is usually faster", @"what goes up must come down", @"be persistent to win a strike", @"dhcs is the bestclassever",@"presidents drive expensive cars", @"the stock exchange dipped", @"why do you ask silly questions", @"that is a very nasty cut", @"what to do when the oil runs dry", @"learn to walk before you run", @"insurance is important for bad drivers", @"traveling to conferences is fun", @"do you get nervous when you speak", @"pumping helps if the roads are slippery", @"parking tickets can be challenged", @"apartments are too expensive", @"find a nearby parking spot", @"gun powder must be handled with care", @"just what the doctor ordered", @"professor harrison is evil", @"a rattle snake is very poisonous", @"weeping willows are found near water", @"i cannot believe i ate the whole thing", @"the biggest hamburger i have ever seen", @"gamblers eventually loose their shirts", @"exercise is good for the mind", @"irregular verbs are the hardest to learn", @"they might find your comment offensive", @"tell a lie and your nose will grow", @"an enlarged nose suggests you are a liar", @"lie detector tests never work", @"do not lie in court or else", @"most judges are very honest", @"only an idiot would lie in court", @"important news always seems to be late", @"please try to be home before midnight", @"if you come home late the doors are locked", @"dormitory doors are locked at midnight", @"staying up all night is a bad idea", @"motivational seminars make me sick", @"these bakeoffs are a lot of work", @"questioning the wisdom of the courts", @"rejection letters are discouraging", @"the first time he tried to swim", @"that referendum asked a silly question", @"a steep learning curve in riding a unicycle", @"a good stimulus deserves a good response", @"everybody looses in custody battles", @"put garbage in an abandoned mine", @"employee recruitment takes a lot of effort", @"experience is hard to come by", @"everyone wants to win the lottery", @"the picket line gives me the chills"];
    
    tempIndex = 0;
    
    [self initButtons];
    [self resetVariables];
    
}

- (void)resetVariables
{
    // STUFF FOR GRADING/ACCURACY
    lettersEntered = 0;
    numTrials = 5;
    errorsTotal = 0;
    startTime = CACurrentMediaTime();
}

- (void)initButtons
{
    // NEXT BUTTON
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextButton addTarget:self
                        action:@selector(next)
              forControlEvents:UIControlEventTouchDown];
    [self.nextButton setImage:[UIImage imageNamed:@"next.png"]
                     forState: UIControlStateNormal];
    self.nextButton.frame = CGRectMake(200, 80, 111, 44.24);
    self.nextButton.tag = 3;
    [self.view addSubview:self.nextButton];
    
    
    // SPACEBAR
    self.spacebar = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.spacebar addTarget:self
                      action:@selector(space)
            forControlEvents:UIControlEventTouchDown];
    [self.spacebar setImage:[UIImage imageNamed:@"spacebar.png"]
                   forState: UIControlStateNormal];
    self.spacebar.frame = CGRectMake(70, 480, 111, 44.25);
    self.spacebar.tag = 4;
    [self.view addSubview:self.spacebar];
    
    
    // BACKSPACE
    self.backspace = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backspace addTarget:self
                       action:@selector(delete)
             forControlEvents:UIControlEventTouchDown];
    [self.backspace setImage:[UIImage imageNamed:@"backspace.png"]
                    forState: UIControlStateNormal];
    self.backspace.frame = CGRectMake(180, 480, 111, 44.25);
    self.backspace.tag = 5;
    [self.view addSubview:self.backspace];
    
    // KEYBOARD 1 ENTER
    self.alph1Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.alph1Button addTarget:self
                         action:@selector(alph1Enter)
               forControlEvents:UIControlEventTouchDown];
    [self.alph1Button setImage:[UIImage imageNamed:@"enter.gif"]
                      forState: UIControlStateNormal];
    self.alph1Button.frame = CGRectMake(70, 300, 56, 30);
    self.alph1Button.tag = 6;
    [self.view addSubview:self.alph1Button];
    
    // KEYBOARD 2 ENTER
    self.alph2Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.alph2Button addTarget:self
                         action:@selector(alph2Enter)
               forControlEvents:UIControlEventTouchDown];
    [self.alph2Button setImage:[UIImage imageNamed:@"enter.gif"]
                      forState: UIControlStateNormal];
    self.alph2Button.frame = CGRectMake(126, 300, 56, 30);
    self.alph2Button.tag = 7;
    [self.view addSubview:self.alph2Button];
    
    // VOWEL KEYBOARD ENTER
    self.vowelsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.vowelsButton addTarget:self
                          action:@selector(vowelsEnter)
                forControlEvents:UIControlEventTouchDown];
    [self.vowelsButton setImage:[UIImage imageNamed:@"enter.gif"]
                       forState: UIControlStateNormal];
    self.vowelsButton.frame = CGRectMake(182, 300, 56, 30);
    self.vowelsButton.tag = 8;
    [self.view addSubview:self.vowelsButton];
    
    pIndex =  arc4random() % ([self.phrases count]);
    
    self.phrase = [[UILabel alloc] initWithFrame:CGRectMake(10, 140, self.view.frame.size.width-20, 100)];
    self.phrase.lineBreakMode = NSLineBreakByWordWrapping;
    self.phrase.numberOfLines = 0;
    self.phrase.text = [@"Phrase: " stringByAppendingString:[self.phrases objectAtIndex:pIndex]];
    self.phrase.tag = 9;
    [self.view addSubview:self.phrase];
    
    self.input = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, self.view.frame.size.width-20, 100)];
    self.input.lineBreakMode = NSLineBreakByWordWrapping;
    self.input.numberOfLines = 0;
    self.input.text = @"Input: ";
    self.input.tag = 10;
    [self.view addSubview:self.input];
}

- (void)next
{
    NSInteger *cost = [self computeLevenshteinDistanceBetween:self.input.text and:self.phrase.text matchGain:0 missingCost:0];
    errorsTotal += cost;
    lettersEntered += [self.input.text length] - 7; // 7 is for the length of "Input :"
    
    int len = [self.phrases count];
    pIndex = (pIndex + 1)%len;
    self.phrase.text = [@"Phrase: " stringByAppendingString:[self.phrases objectAtIndex:pIndex]];

    self.input.text = @"Input: ";
    numTrials -= 1;
    if (numTrials == 0) {
        CFTimeInterval elapsedTime = CACurrentMediaTime() - startTime;

        // Hide everything!
        [[self.view subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        /*
        // DISPLAY RESTART BUTTON
        self.restartButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.restartButton addTarget:self
                            action:@selector(restart)
                  forControlEvents:UIControlEventTouchDown];
        [self.restartButton setImage:[UIImage imageNamed:@"reset.jpg"]
                         forState: UIControlStateNormal];
        self.restartButton.frame = CGRectMake(200, 80, 111, 44.24);
        self.restartButton.tag = 2;
        [self.view addSubview:self.restartButton];
         */
        
        // DISPLAY TOTAL TIME TAKEN AND TOTAL LETTERS ENTERED, as per Chris's email
        self.timeTaken = [[UILabel alloc] initWithFrame:CGRectMake(10, 140, self.view.frame.size.width-20, 100)];
        self.timeTaken.lineBreakMode = NSLineBreakByWordWrapping;
        self.timeTaken.numberOfLines = 0;
        self.timeTaken.text = [NSString stringWithFormat:@"Total Time Taken: %f seconds. (Including error penalty.)", (elapsedTime + (4.0 * errorsTotal))];
        self.timeTaken.tag = 0;
        [self.view addSubview:self.timeTaken];
        
        self.totalLetters = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, self.view.frame.size.width-20, 100)];
        self.totalLetters.lineBreakMode = NSLineBreakByWordWrapping;
        self.totalLetters.numberOfLines = 0;
        self.totalLetters.text = [NSString stringWithFormat:@"Total Letters Entered: %d letters.", lettersEntered];
        self.totalLetters.tag = 1;
        [self.view addSubview:self.totalLetters];
    }
}

/*
- (void)restart
{
    // Get rid of restart button
    [[self.view viewWithTag:2] removeFromSuperview];
    
    // Get rid of time taken and letters entered displays
    [[self.view viewWithTag:0] removeFromSuperview];
    [[self.view viewWithTag:1] removeFromSuperview];
    
    // Reset for next trial
    [self resetVariables];
    [self initButtons];
}*/

- (void)delete
{
    self.input.text = [self.input.text substringToIndex:self.input.text.length-(self.input.text.length>7)];
}

- (void)space
{
     self.input.text = [self.input.text stringByAppendingString:@" "];
}

- (void)alph1Enter
{
    NSArray *alphabet = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m",
                          @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z"];
    self.input.text = [self.input.text stringByAppendingString:[alphabet objectAtIndex:(tempIndex % [alphabet count])]];
}

- (void)alph2Enter
{
    NSArray *alphabet = @[@"t", @"u", @"v", @"w", @"x", @"y", @"z", @"a", @"b", @"c", @"d", @"e", @"f",
                          @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s"];
    self.input.text = [self.input.text stringByAppendingString:[alphabet objectAtIndex:(tempIndex % [alphabet count])]];
}

- (void)vowelsEnter
{
    NSArray *alphabet = @[@"a", @"e", @"i", @"o", @"u", @"y"];
    self.input.text = [self.input.text stringByAppendingString:[alphabet objectAtIndex:(tempIndex % [alphabet count])]];
}

- (NSInteger) computeLevenshteinDistanceBetween:(NSString *) stringA and:(NSString *) stringB
          matchGain:(NSInteger)gain missingCost:(NSInteger)cost {
	// normalize strings
	stringA = [[stringA stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] lowercaseString];
	stringB = [[stringB stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] lowercaseString];
	
	// Step 1
	NSInteger k, i, j, change, *d, distance;
	
	NSUInteger n = [stringA length];
	NSUInteger m = [stringB length];
	
	if( n++ != 0 && m++ != 0 ) {
		d = malloc( sizeof(NSInteger) * m * n );
		
		// Step 2
		for( k = 0; k < n; k++)
			d[k] = k;
		
		for( k = 0; k < m; k++)
			d[ k * n ] = k;
		
		// Step 3 and 4
		for( i = 1; i < n; i++ ) {
			for( j = 1; j < m; j++ ) {
				
				// Step 5
				if([stringA characterAtIndex: i-1] == [stringB characterAtIndex: j-1]) {
					change = -gain;
				} else {
					change = cost;
				}
				
				// Step 6
				d[ j * n + i ] = MIN(d [ (j - 1) * n + i ] + 1, MIN(d[ j * n + i - 1 ] +  1, d[ (j - 1) * n + i -1 ] + change));
			}
		}
		
		distance = d[ n * m - 1 ];
		free( d );
		return distance;
	}
	
	return 0;
}


#pragma IZValueSelector dataSource
- (NSInteger)numberOfRowsInSelector:(IZValueSelectorView *)valueSelector {
    if (valueSelector == self.vowels) {
        return 6;
    }
    return 1000;
}

//ONLY ONE OF THESE WILL GET CALLED (DEPENDING ON the horizontalScrolling property Value)
- (CGFloat)rowHeightInSelector:(IZValueSelectorView *)valueSelector {
    return 40;
}

- (CGFloat)rowWidthInSelector:(IZValueSelectorView *)valueSelector {
    return 70;
}

- (UIView *)selector:(IZValueSelectorView *)valueSelector viewForRowAtIndex:(NSInteger)index
{
    return [self selector:valueSelector viewForRowAtIndex:(index%26) selected:NO];
}

- (UIView *)selector:(IZValueSelectorView *)valueSelector viewForRowAtIndex:(NSInteger)index selected:(BOOL)selected {
    UILabel * label = nil;
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.alphabet1.frame.size.width, 20)];
    NSArray *alphabet = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m",
                          @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z"];
    if (valueSelector == self.vowels) {
        alphabet = @[@"a", @"e", @"i", @"o", @"u", @"y"];
    }
    if (valueSelector == self.alphabet2) {
        alphabet = @[@"t", @"u", @"v", @"w", @"x", @"y", @"z", @"a", @"b", @"c", @"d", @"e", @"f",
                     @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s"];
    }
    label.text = [alphabet objectAtIndex:(index%26)];
    label.textAlignment =  NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:20];
    label.backgroundColor = [UIColor clearColor];
    if (selected) {
        label.textColor = [UIColor redColor];
    } else {
        label.textColor = [UIColor blackColor];
    }
    return label;
}

- (CGRect)rectForSelectionInSelector:(IZValueSelectorView *)valueSelector {
    return CGRectMake(0.0, self.alphabet1.frame.size.height/2 - 35.0, 90.0, 70.0);

}

#pragma IZValueSelector delegate
- (void)selector:(IZValueSelectorView *)valueSelector didSelectRowAtIndex:(NSInteger)index {
    //NSLog(@"Selected index %d",index);
    tempIndex = index;
}


@end
