//
//  TableViewController.h
//  myCars
//
//  Created by PAUL CHRISTIAN on 12/14/17.
//  Copyright © 2017 PAUL CHRISTIAN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@interface TableViewController : UITableViewController
{
    AppDelegate *appDelegate;
    NSManagedObjectContext *context;
    
}


@end
