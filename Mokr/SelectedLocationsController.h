//
//  SelectedLocationsController.h
//  Mokr
//
//  Created by Jernej Virag on 8/15/11.
//  Copyright (c) 2011 Jernej Virag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Data/Location.h"

@interface SelectedLocationsController : NSObject {
    NSMutableArray *selectedLocations;
    
    NSUserDefaults *defaults;
}

@property(strong, readonly) NSMutableArray *selectedLocations;

- (void) addSelectedLocation:(Location*)location;
- (void) removeSelectedLocationsAt:(int)index;
- (void) loadFromDefaults;
- (void) storeToDefaults;

@end
