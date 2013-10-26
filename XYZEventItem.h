//
//  XYZEventItem.h
//  MomentNotice
//
//  Created by LiuLeon on 10/25/2013.
//  Copyright (c) 2013 LiuLeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZEventItem : NSObject
@property NSString* eventName;
@property BOOL completed;
@property (readonly) NSDate* creationDate;

@end
