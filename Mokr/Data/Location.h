//
//  Location.h
//  Mokr
//
//  Created by Jernej Virag on 8/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Location : NSObject {
    NSString* locationName;
    CLLocationCoordinate2D coordinate;
}

@property(strong, nonatomic) NSString* locationName;
@property(nonatomic) CLLocationCoordinate2D coordinate;

-(id) initWithLocation:(NSString*)name atCoordinate:(CLLocationCoordinate2D)location;

@end
