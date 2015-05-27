//
//  Event.h
//  MeetMeUp
//
//  Created by Brent Dady on 5/26/15.
//  Copyright (c) 2015 Brent Dady. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface Event : NSObject

@property NSString *name;
@property NSNumber *rsvpCount;
@property NSDictionary *hostGroupInfo;
@property NSString *eventDescription;
@property NSString *url;

- (instancetype)initWithName:(NSString *)name rsvp:(NSNumber *)rsvpCount host:(NSDictionary *)hostGroupInfo description:(NSString *)eventDescription url:(NSString *)url;

@end
