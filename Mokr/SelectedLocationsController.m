//
//  SelectedLocationsController.m
//  Mokr
//
//  Created by Jernej Virag on 8/15/11.
//  Copyright (c) 2011 Jernej Virag. All rights reserved.
//

#import "SelectedLocationsController.h"

@implementation SelectedLocationsController

@synthesize selectedLocations;

- (id) init {
    self = [super init];
    if (self)
    {
        selectedLocations = [[NSMutableArray alloc] init];
        defaults = [NSUserDefaults standardUserDefaults];
        [self loadFromDefaults];
    }
    return self;
}

- (void) addSelectedLocation:(Location*)location
{
    [self.selectedLocations addObject:location];
    [self storeToDefaults];
}

- (void) removeSelectedLocationsAt:(int)index {
    [self.selectedLocations removeObjectAtIndex:index];
    [self storeToDefaults];
}

- (void) loadFromDefaults
{
    selectedLocations = [[NSMutableArray alloc] init];
    NSArray *storedLocations = [defaults arrayForKey:@"locations"];
    
    if (storedLocations)
    {
        for (NSDictionary *location in storedLocations)
        {
            NSString* name = [location objectForKey:@"name"];
            NSNumber* lat = [location objectForKey:@"lat"];
            NSNumber* lng = [location objectForKey:@"lng"];
            
            CLLocationCoordinate2D coord;
            coord.latitude = [lat doubleValue];
            coord.longitude = [lng doubleValue];
            
            Location *location = [[Location alloc] initWithLocation:name atCoordinate:coord];
            [selectedLocations addObject:location];
        }
    }
}

- (void) storeToDefaults
{
    NSMutableArray *serializedLocations = [[NSMutableArray alloc] init];
    
    for (Location *loc in selectedLocations)
    {
        NSMutableDictionary *location = [[NSMutableDictionary alloc] init];
        [location setObject:loc.locationName forKey:@"name"];
        [location setObject:loc.latitude forKey:@"lat"];
        [location setObject:loc.longtitude forKey:@"lng"];
        [serializedLocations addObject:location];
    }
    
    [defaults setObject:serializedLocations forKey:@"locations"];
    [defaults synchronize];
}

@end
