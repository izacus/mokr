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
    }
    return self;
}

- (void) addSelectedLocation:(Location*)location
{
    [self.selectedLocations addObject:location];
}

- (void) removeSelectedLocationsAt:(int)index {
    [self.selectedLocations removeObjectAtIndex:index];
}


@end
