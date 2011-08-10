//
//  LocationsViewController.m
//  Mokr
//
//  Created by Jernej Virag on 8/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "LocationsViewController.h"

@implementation LocationsViewController

@synthesize locationList;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (id) initWithAction:(void (^)(void))action
{
    self = [self init];
    
    if (self != nil)
    {
        self->doneCallback = action;
    }
    
    return self;
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    UIView *main = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [self setView:main];
    
    // Create navigation bar
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [navBar setBarStyle:UIBarStyleBlackOpaque];
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"Lokacije"];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Nazaj" style:UIBarButtonItemStyleDone 
                                                           target:self action:@selector(doneButtonPressed:)];
    
    [item setLeftBarButtonItem:doneButton];
    [navBar pushNavigationItem:item animated:NO];
    [main addSubview:navBar];
    
    UITableView *locations = [[UITableView alloc] initWithFrame:CGRectMake(20, 64, 280, 260) style:UITableViewStylePlain];
    [self setLocationList:locations];
    [main addSubview:locations];
}

- (void) doneButtonPressed:(id)sender
{
    doneCallback();
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
