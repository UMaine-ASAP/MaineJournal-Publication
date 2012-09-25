//
//  ViewController.h
//  ModalWindow
//
//  Created by admin on 9/21/12.
//  Copyright (c) 2012 asap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewController.h"

@interface ViewController : UIViewController {
UIButton *showDefaultButton, *showFlipButton, *showDissolveButton, *showCurlButton;
}

@property (nonatomic, retain) IBOutlet UIButton *showDefaultButton, *showFlipButton, *showDissolveButton, *showCurlButton;

- (IBAction)showDefault:(id)sender;
- (IBAction)showFlip:(id)sender;
- (IBAction)showDissolve:(id)sender;
- (IBAction)showCurl:(id)sender;

@end
