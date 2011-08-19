//
//  ViewController.h
//  Mokr
//
//  Created by Jernej Virag on 8/9/11.
//  Copyright (c) 2011 Jernej Virag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectedLocationsController.h"
#import "Location.h"

@interface HomeViewController : UIViewController<UIScrollViewDelegate> {
    UIScrollView *scrollView;
    UIPageControl *scrollPageControl;
    UIButton *infoButton;
    
    NSMutableArray *locationViews;
    
    // List of all known locations
    SelectedLocationsController *selectedLocations;
}

@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UIPageControl *scrollPageControl;
@property(nonatomic, strong) UIButton *infoButton;
@property(nonatomic, strong) SelectedLocationsController *selectedLocations;

- (void)showAddLocation:(id)sender;

@end
