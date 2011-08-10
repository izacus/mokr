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

// Search bar management functions
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* tableViewIdentifier = @"LocationTable";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d", [indexPath row]];
    return cell;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar {
    [searchBar resignFirstResponder];
    [UIView animateWithDuration:0.5 animations:^(void) {
        [searchBar setFrame:CGRectMake(0, -44, 320, 44)];  
    }];
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
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
                                                           target:self action:@selector(addButtonPressed:)];
    [item setLeftBarButtonItem:doneButton];
    [item setRightBarButtonItem:addButton];
    [navBar pushNavigationItem:item animated:NO];
    [main addSubview:navBar];
    
    UITableView *locations = [[UITableView alloc] initWithFrame:CGRectMake(20, 64, 280, 260) style:UITableViewStylePlain];
    [self setLocationList:locations];
    [main addSubview:locations];
}

- (void) addButtonPressed:(id)sender
{
    // Create a search bar
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, -44, 320, 44)];
    [searchBar setBarStyle:UIBarStyleBlackOpaque];
    [searchBar setShowsCancelButton:YES];
    [searchBar setDelegate:self];
    [self.view addSubview:searchBar];
    
    // Create the controller for search bar
    UISearchDisplayController *searchController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    [searchController setSearchResultsDataSource:self];
    
    // Pop in search bar with animation
    [UIView animateWithDuration:0.5 animations:^(void) {
        [searchBar setFrame:CGRectMake(0, 0, 320, 44)];

    } completion:^(BOOL finished) {
        [searchBar becomeFirstResponder];
    }];
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
