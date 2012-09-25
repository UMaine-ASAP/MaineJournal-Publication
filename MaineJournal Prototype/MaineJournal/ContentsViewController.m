//
//  ContentsViewController.m
//  MaineJournal
//
//  Created by asap on 9/24/12.
//  Copyright (c) 2012 asap. All rights reserved.
//

#import "ContentsViewController.h"
#import "ArticleViewController.h"

@interface ContentsViewController () {
    NSArray*    threePageScroller_Views;
    NSArray*    longScroller_Views;
}

- (NSMutableArray *) generateSampleUIViews:(NSUInteger) number width:(CGFloat) wd;

- (IBAction)btn_goWeb:(id)sender;


@end

@implementation ContentsViewController

- (IBAction)btn_goWeb:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.danielemargutti.com"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    contentsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 500, 500)];
    contentsView.backgroundColor = [UIColor blackColor];
    
    contentsViewText = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    contentsViewText.text = [NSString stringWithFormat:@"Ohaidere, Welcome to the Maine Journal"];
    [contentsViewText setFont:[UIFont fontWithName:@"ArialMT" size:20]];
    [contentsView addSubview:contentsViewText];
    
    [self.view addSubview:contentsView];
    
    // Long Scrollview
    longScrollView = [[DMCircularScrollView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - 200), self.view.frame.size.width, 200)];
    longScroller_Views = [self generateSampleUIViews:15 width:100];
    longScrollView.pageWidth = 100;
    
    [longScrollView setPageCount:[longScroller_Views count]
                  withDataSource:^UIView *(NSUInteger pageIndex) {
                      return [longScroller_Views objectAtIndex:pageIndex];
                  }];
    
      // How to handle page events change
    longScrollView.handlePageChange =  ^(NSUInteger currentPageIndex,NSUInteger previousPageIndex) {
        
        contentsViewText.text = [NSString stringWithFormat:@"%d", currentPageIndex];
        contentsViewText.tag = currentPageIndex;
        NSLog(@"PAGE HAS CHANGED. CURRENT PAGE IS %d (prev=%d)",currentPageIndex,previousPageIndex);
    
        contentsViewText.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = \
        [[UITapGestureRecognizer alloc]
         initWithTarget:self action:@selector(didTapLabelWithGesture:)];
        [contentsViewText addGestureRecognizer:tapGesture];
        
        //NSLog(longScroller_Views[currentPageIndex]);
    };
    
    [self.view addSubview:longScrollView];
    
}

+ (UIColor *) randomColor
{
	CGFloat red =  (CGFloat)random()/(CGFloat)RAND_MAX;
	CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
	CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
	return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

- (NSMutableArray *) generateSampleUIViews:(NSUInteger) number width:(CGFloat) wd {
    NSMutableArray *views_list = [[NSMutableArray alloc] init];
    
    for (NSUInteger k = 0; k < 8; k++) {
        UIView *back_view = [[UIView alloc] initWithFrame:CGRectMake(0,0, wd, 100)];
        
        UIButton*btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:[NSString stringWithFormat:@"%d",k] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:40];
        [btn setFrame:back_view.bounds];
        [btn addTarget:self action:@selector(btn_tapButton:) forControlEvents:UIControlEventTouchUpInside];
        [btn setUserInteractionEnabled:YES];
        
        back_view.backgroundColor = [ContentsViewController randomColor];
        
        [back_view addSubview:btn];
        [views_list addObject: back_view];
    }
    return views_list;
}

- (void) btn_tapButton:(UIButton *) btn {
    
    /*UIAlertView *a = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Tapped page %@!",[btn titleForState:UIControlStateNormal]]
                                                message:@"Good, I really like it! Touch me again!"
                                               delegate:nil
                                      cancelButtonTitle:@"Sure!" otherButtonTitles:nil];
    [a show];*/
}

- (void)didTapLabelWithGesture:(UITapGestureRecognizer *)tapGesture {
    NSLog(@"%d", tapGesture.view.tag);
    ArticleViewController *vcA = [[ArticleViewController alloc] init];
    [self.view addSubview:vcA.view];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end