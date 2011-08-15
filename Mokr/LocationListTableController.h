//
//  LocationListTableController.h
//  Mokr
//
//  Created by Jernej Virag on 8/15/11.
//  Copyright (c) 2011 Jernej Virag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SelectedLocationsController.h"

@interface LocationListTableController : NSObject <UITableViewDataSource, UITableViewDelegate> {
    SelectedLocationsController *locationsController;
}

@property(strong, nonatomic) SelectedLocationsController* locationsController;

- (id) initWithSelectedLocationsController:(SelectedLocationsController*)selectedLocationsController;

@end
