//
//  LocationsViewController.h
//  Mokr
//
//  Created by Jernej Virag on 8/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data/DatabaseController.h"

@interface LocationsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate> {
    UITableView *locationList;
    UISearchDisplayController *searchController;
    // Location database manager
    DatabaseController *databaseController;
    NSArray *foundLocations;
    // Call when done
    void(^doneCallback)(void);
}

@property(strong, nonatomic) UITableView* locationList;
@property(strong, nonatomic) UISearchDisplayController *searchController;
@property(strong, nonatomic) DatabaseController* databaseController;
@property(strong, nonatomic) NSArray *foundLocations;

- (id) initWithAction:(void (^)(void))action;
- (void) addButtonPressed:(id)sender;
- (void) doneButtonPressed:(id)sender;

@end
