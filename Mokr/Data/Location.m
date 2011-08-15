//
//  Location.m
//  Mokr
//
//  Created by Jernej Virag on 8/10/11.
//  Copyright (c) 2011 Jernej Virag. All rights reserved.
//

#import "Location.h"

@implementation Location 
@synthesize locationName, latitude, longtitude;

-(id) initWithLocation:(NSString*)name atCoordinate:(CLLocationCoordinate2D)location
{
    self = [super init];
    
    if (self != nil)
    {
        [self setLocationName:name];
        [self setLatitude:[NSNumber numberWithDouble:location.latitude]];
        [self setLongtitude:[NSNumber numberWithDouble:location.longitude]];
    }
    
    return self;
}

-(id) init
{
    CLLocationCoordinate2D empty;
    return [self initWithLocation:nil atCoordinate:empty];
}

@end
