//
//  LocationsViewController.h
//  Mokr
//
//  Created by Jernej Virag on 8/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationsViewController : UIViewController {
    UITableView *locationList;
    
    // Call when done
    void(^doneCallback)(void);
}

@property(strong, nonatomic) UITableView* locationList;

- (id) initWithAction:(void (^)(void))action;
- (void) doneButtonPressed:(id)sender;

@end
