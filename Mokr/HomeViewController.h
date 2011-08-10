//
//  ViewController.h
//  Mokr
//
//  Created by Jernej Virag on 8/9/11.
//  Copyright (c) 2011 Jernej Virag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController {
    UIScrollView *scrollView;
    UIButton *infoButton;
    
    // List of all known locations
}

@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UIButton *infoButton;

- (void)showAddLocation;

@end
