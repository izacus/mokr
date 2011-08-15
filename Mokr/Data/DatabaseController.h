//
//  DatabaseController.h
//  Mokr
//
//  Created by Jernej Virag on 8/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Location.h"

@interface DatabaseController : NSObject {
    sqlite3 *database;
}

- (NSArray*) getCitiesWithName:(NSString*)name;

@end
