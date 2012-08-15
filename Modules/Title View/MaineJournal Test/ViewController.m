//
//  ViewController.m
//  MaineJournal Test
//
//  Created by Ben Carlson on 8/14/12.
//  Copyright (c) 2012 ASAP. All rights reserved.
//


#import "ViewController.h"
#import "InfinitePagingView.h"

@interface ViewController() <InfinitePagingViewDelegate>

@end

@implementation ViewController
{
    UIPageControl *pageControl;
    InfinitePagingView *pagingView;
}

UIImageView *articleImages[12];

- (void)viewDidLoad
{
    [super viewDidLoad];

////////////////////
//Article View
////////////////////
    self.view.backgroundColor = [UIColor blackColor];
    
    // pagingView
    pagingView = [[InfinitePagingView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.view.frame.size.width, self.view.frame.size.height)];
    pagingView.delegate = self;
    [self.view addSubview:pagingView];
    
    for (NSUInteger i = 1; i <= 15; ++i) {
        UIView *page = [[UIView alloc] init];
        page.frame = CGRectMake(0.f, 0.f, pagingView.frame.size.width, pagingView.frame.size.height);
        page.backgroundColor = [self getRandomColor];
        
        UITextView *content = [[UITextView alloc] init];
        content.frame = CGRectMake(50, 50, 300, 300);
        content.text = [NSString stringWithFormat:@"I BAKED YOU A PIE, ITS NUMBER %d", i];
        content.textColor = [UIColor whiteColor];
        content.backgroundColor = [UIColor clearColor];
        [content setFont:[UIFont fontWithName:@"ArialMT" size:24]];
        [page addSubview:content];
        
        UIImage *kittyPicture = [UIImage imageNamed:[NSString stringWithFormat:@"%d.JPG", i]];
        UIImageView *kitty = [[UIImageView alloc] initWithImage:kittyPicture];
        kitty.frame = CGRectMake(50, 400, 300, 400);
        kitty.contentMode = UIViewContentModeScaleToFill;
        [page addSubview:kitty];
        
        [pagingView addPageView:page];
    }
    
    // Page controller
    pageControl = [[UIPageControl alloc] init];
    pageControl.center = CGPointMake(self.view.center.x, pagingView.frame.size.height - 30.f);
    pageControl.numberOfPages = 15;
    [self.view addSubview:pageControl];
    
////////////////////
//Dropdown View
////////////////////    
    width = CGRectGetWidth(self.view.bounds);
    
    CGFloat xOffset = 0;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        xOffset = width/2;
    }
    
    pullDownView = [[PullableView alloc] initWithFrame:CGRectMake(xOffset, 0, 568, 620)];
    pullDownView.backgroundColor = [UIColor blackColor];
    pullDownView.openedCenter = CGPointMake(xOffset,270);
    pullDownView.closedCenter = CGPointMake(xOffset, -270);
    pullDownView.center = pullDownView.closedCenter;
    
    [self.view addSubview:pullDownView];
    
    int thumbWidth = 150;
    int thumbHeight = 100;
    int colCount = 3;
    int rowCount = 4;
    
    int xInc = pullDownView.frame.size.width/ colCount;
	int yInc = (pullDownView.frame.size.height/ rowCount)-thumbHeight;
    
    int spacing = (pullDownView.frame.size.width - thumbWidth * colCount)/(colCount * 2);
    
	for (int j = 0; j < 4; j++)
	{
		// Places the images in rows of three
		for (int i = 0; i < colCount; i++)
        {
            // Create the article images that will bring the user to the specified article
            UIImage *kittyPicture = [UIImage imageNamed:[NSString stringWithFormat:@"%d.JPG", j+i+1]];
            
            articleImages[i] = [[UIImageView alloc] initWithImage:kittyPicture];
            articleImages[i].frame = CGRectMake((spacing * 1.5) + (spacing * 2 + thumbWidth)*i + ((i>0) ? (-(spacing/2)*i) : 0), yInc, thumbWidth, thumbHeight);
            articleImages[i].backgroundColor = [UIColor yellowColor];
            

            [pullDownView addSubview:articleImages[i]];
        }
		
		yInc = yInc + 140;
		xInc = pullDownView.frame.size.width/3;
	}

}

#pragma mark - InfinitePagingViewDelegate

- (UIColor *) getRandomColor {
	CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
	CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
	CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
	return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (void)pagingView:(InfinitePagingView *)pagingView didEndDecelerating:(UIScrollView *)scrollView atPageIndex:(NSInteger)pageIndex
{
    pageControl.currentPage = pageIndex;
}

@end
