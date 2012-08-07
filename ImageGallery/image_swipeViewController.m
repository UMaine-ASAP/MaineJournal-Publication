//
//  image_swipeViewController.m
//  ImageGallery
//
//  Created by Will Hofacker on 7/24/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import "image_swipeViewController.h"

@interface image_swipeViewController ()

@end

@implementation image_swipeViewController

- (void)viewDidLoad{
    
    // setups up the positions
    touchPos = CGPointMake(0.0, 0.0);
    center = CGPointMake( 384, 350);
    [super viewDidLoad];
    
    // makes an array out of the images
    gallery = [[NSMutableArray alloc]init];
    [gallery addObject:[UIImage imageNamed:@"candle.jpg"]];
    [gallery addObject:[UIImage imageNamed:@"heads.jpg"]];
    [gallery addObject:[UIImage imageNamed:@"mirror.jpg"]];
    [gallery addObject:[UIImage imageNamed:@"more_random.jpg"]];
    [gallery addObject:[UIImage imageNamed:@"planets.jpg"]];
    [gallery addObject:[UIImage imageNamed:@"radial.jpg"]];
    [gallery addObject:[UIImage imageNamed:@"random.jpg"]];
    [gallery addObject:[UIImage imageNamed:@"water.jpg"]];
    
    // makes an array of titles
    subtitles = [[NSMutableArray alloc]init];
    [subtitles addObject:[NSString stringWithFormat:@"Candle In a Forest"]];
    [subtitles addObject:[NSString stringWithFormat:@"Moutian Heads Overlook an Ocean"]];
    [subtitles addObject:[NSString stringWithFormat:@"The Casimir Effect"]];
    [subtitles addObject:[NSString stringWithFormat:@"I Have no Idea"]];
    [subtitles addObject:[NSString stringWithFormat:@"Planet Undergoing Construction"]];
    [subtitles addObject:[NSString stringWithFormat:@"An Eye"]];
    [subtitles addObject:[NSString stringWithFormat:@"Many Perspectives On Many Differnt Things"]];
    [subtitles addObject:[NSString stringWithFormat:@"Some Water, a Worm Thing, and a Giant I Guess"]];
    
    // makes and setsup the large display
    image = [gallery objectAtIndex:0];
    main = [[largeDisplay alloc]init];
    [main instantiate:image :center :[subtitles objectAtIndex:0]];
    [main drawOnScreen:self.view];
    
    // makes and setsup the sub display
    images = [[picGroup alloc]init];
    [images instantiate:gallery];
    [images drawOnView:self.view];
    
    
    
}

// detects the touches on the sub display
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *myTouch = [[event allTouches] anyObject];
    touchPos = [myTouch locationInView:self.view];
    NSMutableArray *temp = [images getArray];
    for (int i = 0; i<temp.count; i++) {
        holder = [temp objectAtIndex:i];
        [holder drawSmall:self.view];
        if ([holder inBox:touchPos.x :touchPos.y]){
            [main changeImage:[holder getPicture]];
            [holder drawBig:self.view];
        }
    }
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
