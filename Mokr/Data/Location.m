//
//  Location.m
//  Mokr
//
//  Created by Jernej Virag on 8/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Location.h"

@implementation Location 
@synthesize locationName, coordinate;

-(id) initWithLocation:(NSString*)name atCoordinate:(CLLocationCoordinate2D)location
{
    self = [super init];
    
    if (self != nil)
    {
        [self setLocationName:name];
        [self setCoordinate:location];
    }
    
    return self;
}

-(id) init
{
    CLLocationCoordinate2D empty;
    return [self initWithLocation:nil atCoordinate:empty];
}

@end
