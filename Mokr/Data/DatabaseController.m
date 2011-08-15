//
//  DatabaseController.m
//  Mokr
//
//  Created by Jernej Virag on 8/15/11.
//  Copyright (c) 2011 Jernej Virag. All rights reserved.
//

#import "DatabaseController.h"
#import <CoreLocation/CoreLocation.h>

@implementation DatabaseController

- (id) init {
    self = [super init];
    
    if (self)
    {
        NSString *databasePath = [[NSBundle mainBundle] pathForResource:@"cities" ofType:@"db"];
        
        sqlite3 *citiesDatabase;
        
        if (sqlite3_open([databasePath UTF8String], &citiesDatabase) == SQLITE_OK)
        {
            NSLog(@"Cities database opened OK.");
            database = citiesDatabase;
        }
    }
    
    return self;
}

- (NSArray*) getCitiesWithName:(NSString*)name {
    NSMutableArray *cities = [[NSMutableArray alloc] init];
    NSString *sqlQuery = [NSString stringWithFormat:@"SELECT name, lat, long FROM locations WHERE name LIKE '%%%@%%'", name];
    
    if (database)
    {
        sqlite3_stmt* statement;
        
        NSLog(@"Searching for %@...", name);
        
        if (sqlite3_prepare_v2(database, [sqlQuery UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString *name = [NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 0)];
                NSNumber *lat = [NSNumber numberWithDouble:sqlite3_column_double(statement, 1)];
                NSNumber *lng = [NSNumber numberWithDouble:sqlite3_column_double(statement, 2)];
                
                CLLocationCoordinate2D coordinate;
                coordinate.latitude = [lat doubleValue];
                coordinate.longitude = [lng doubleValue];
                
                Location *location = [[Location alloc] initWithLocation:name atCoordinate:coordinate];
                [cities addObject:location];
            }
        }
        
        NSLog(@"Found %d items.", [cities count]);
    }
    
    return [NSArray arrayWithArray:cities];
};

-(void) dealloc {
    if (database)
        sqlite3_close(database);
}

@end
