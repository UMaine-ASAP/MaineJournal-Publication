//
//  ModalViewController.h
//  ModalWindow
//
//  Created by admin on 9/21/12.
//  Copyright (c) 2012 asap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalViewController : UIViewController {
    UIButton *dismissViewButton;
}

@property (nonatomic, retain) IBOutlet UIButton *dismissViewButton;

- (IBAction)dismissView:(id)sender;

@end
