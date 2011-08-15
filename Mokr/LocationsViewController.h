//
//  LocationsViewController.h
//  Mokr
//
//  Created by Jernej Virag on 8/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data/DatabaseController.h"
#import "LocationListTableController.h"
#import "SelectedLocationsController.h"

@interface LocationsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate> {
    UITableView *locationList;
    UISearchDisplayController *searchController;
    UISearchBar *searchBar;
    // User selected locations
    SelectedLocationsController *selectedLocations;
    LocationListTableController *locationsListController;
    // Location database manager
    DatabaseController *databaseController;
    NSArray *foundLocations;
    // Call when done
    void(^doneCallback)(void);
}

@property(strong, nonatomic) UITableView* locationList;
@property(strong, nonatomic) UISearchDisplayController *searchController;
@property(strong, nonatomic) UISearchBar *searchBar;
@property(strong, nonatomic) LocationListTableController* locationsListController;
@property(strong, nonatomic) SelectedLocationsController* selectedLocations;
@property(strong, nonatomic) DatabaseController* databaseController;
@property(strong, nonatomic) NSArray *foundLocations;

- (id) initWithAction:(void (^)(void))action;
- (void) addButtonPressed:(id)sender;
- (void) doneButtonPressed:(id)sender;
- (void) hideSearchBar;


- (void) addSelectedLocation:(Location*)location;

@end
