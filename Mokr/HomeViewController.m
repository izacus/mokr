//
//  ViewController.m
//  Mokr
//
//  Created by Jernej Virag on 8/9/11.
//  Copyright (c) 2011 Jernej Virag. All rights reserved.
//

#import "HomeViewController.h"
#import "LocationsViewController.h"

@implementation HomeViewController

// Properties
@synthesize scrollView, infoButton;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (UIView*)createLocationView:(int)viewIndex
{
    UIView *locationView = [[UIView alloc] initWithFrame:CGRectMake(viewIndex * 320, 0, 320, 400)];
    UIView *innerView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 280, 400)];
    [locationView addSubview:innerView];
    [innerView setBackgroundColor:[UIColor blueColor]];
     
    return locationView;
}

// Create main application views
- (void)loadView
{
    UIView *main = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    // Attach main view to application
    [self setView:main];
    
    // Create scrollview to span application
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 440)];
    [scroll setPagingEnabled:YES];
    [scroll setShowsHorizontalScrollIndicator:NO];
    [scroll setShowsVerticalScrollIndicator:NO];
    [self setScrollView: scroll];
    [main addSubview:scroll];
    
    // TODO: Create views for each location
    [scroll setContentSize:CGSizeMake(320 * 2, 440)];
    UIView *locationView = [self createLocationView:0];
    [scroll addSubview:locationView];
    // Create another one
    locationView = [self createLocationView:1];
    [scroll addSubview:locationView];
    
    // Create info button to add location
    UIButton *info = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [info setFrame:CGRectMake(280, 420, 20, 20)];
    [info addTarget:self action:@selector(showAddLocation:) forControlEvents:UIControlEventTouchUpInside];
    [self setInfoButton:info];
    [main addSubview:info];
}

- (void)showAddLocation:(id)sender
{
    __block id me = self;
    LocationsViewController *locations = [[LocationsViewController alloc] initWithAction:^(void){
        [me dismissModalViewControllerAnimated:YES]; 
    }];
    [locations setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    [self presentModalViewController:locations animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
