//
//  CoverViewController.m
//  MaineJournal Test
//
//  Created by ben on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CoverViewController.h"
#import "InfinitePagingView.h"

@interface CoverViewController ()

@end

@implementation CoverViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
 
    CGFloat sliderHeight = 150;

    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //Everything Title Text
    titleView = [[UITextView alloc] initWithFrame:CGRectMake(100, 100, self.view.frame.size.width, 200)];
    titleView.text = [NSString stringWithFormat:@"Ohaidere, Welcome to the Maine Journal"];
    [titleView setFont:[UIFont fontWithName:@"ArialMT" size:75]];
    [self.view addSubview:titleView];
    
    // PageSliderView
    pagingView = [[InfinitePagingView alloc] initWithFrame:CGRectMake(0.f, (self.view.frame.size.height)- sliderHeight, self.view.frame.size.width, sliderHeight)];
    pagingView.backgroundColor = [UIColor greenColor];
    pagingView.pageSize = CGSizeMake(120.f, self.view.frame.size.height);
    [self.view addSubview:pagingView];
    

    // Basic loop to fill with stories until it's actually hooked up.
    for (NSUInteger i = 1; i <= 1; ++i) {
        
        sliderObject = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, 100.f, pagingView.frame.size.height)];
        sliderObject.backgroundColor = [UIColor blueColor];
        
        sliderButton = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, 100.f, pagingView.frame.size.height)];
        [sliderButton setTag: i];
        [sliderButton setUserInteractionEnabled:YES];
        [sliderButton canBecomeFirstResponder];
        sliderButton.backgroundColor = [UIColor orangeColor];
        sliderButton.exclusiveTouch = YES;
        
        UITapGestureRecognizer *TapRec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapDetected:)];
        TapRec.numberOfTouchesRequired = 1;
        [sliderButton addGestureRecognizer:TapRec];
        
        [sliderObject setUserInteractionEnabled:YES];
        [sliderObject addSubview:sliderButton];
        

        
        /*
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.JPG", i]];
        UIImageView *page = [[UIImageView alloc] initWithImage:image];
        page.frame = CGRectMake(0.f, 0.f, 100.f, pagingView.frame.size.height);
        page.contentMode = UIViewContentModeScaleAspectFit;
        
        UIButton *kittyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        kittyButton.frame = CGRectMake(0.f, 0.f, 100.f, pagingView.frame.size.height);
        
        
        [kittyButton addTarget:self action:@selector(test) forControlEvents:UIControlEventAllEvents];
        kittyButton.exclusiveTouch = YES;
        
        [page setUserInteractionEnabled:YES];
        [page addSubview:kittyButton];
        [page bringSubviewToFront:kittyButton];*/

        
        [pagingView addPageView:sliderObject];
    }

}

- (void)TapDetected:(UITapGestureRecognizer *)TapRec
{
    NSLog(@"Please");
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
