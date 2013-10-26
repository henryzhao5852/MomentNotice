//
//  XYZAddNewEventViewController.h
//  MomentNotice
//
//  Created by LiuLeon on 10/25/2013.
//  Copyright (c) 2013 LiuLeon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYZEventItem.h"
#import <sqlite3.h>


@interface XYZAddNewEventViewController : UIViewController
{
    sqlite3 *db;
}

@property XYZEventItem* addEventItem;

@end
