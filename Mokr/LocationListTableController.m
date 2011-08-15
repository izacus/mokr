//
//  LocationListTableController.m
//  Mokr
//
//  Created by Jernej Virag on 8/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "LocationListTableController.h"

@implementation LocationListTableController

@synthesize locationsController;

- (id) initWithSelectedLocationsController:(SelectedLocationsController*)selectedLocationsController
{
    self = [super init];
    
    if (self)
    {
        [self setLocationsController:selectedLocationsController];
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.locationsController.selectedLocations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* tableViewIdentifier = @"LocationListTable";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewIdentifier];
    }
    
    Location *location = [self.locationsController.selectedLocations objectAtIndex:[indexPath row]];
    
    if (location)
        cell.textLabel.text = [NSString stringWithFormat:@"%@", location.locationName];
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.locationsController removeSelectedLocationsAt:[indexPath row]];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
