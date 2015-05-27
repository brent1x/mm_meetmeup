//
//  Event.m
//  MeetMeUp
//
//  Created by Brent Dady on 5/26/15.
//  Copyright (c) 2015 Brent Dady. All rights reserved.
//

#import "Event.h"

@implementation Event

- (instancetype)initWithName:(NSString *)name rsvp:(NSNumber *)rsvpCount host:(NSDictionary *)hostGroupInfo description:(NSString *)eventDescription url:(NSString *)url {

    self = [super init];
    self.name = name;
    self.rsvpCount = rsvpCount;
    self.hostGroupInfo = hostGroupInfo;
    self.eventDescription = eventDescription;
    self.url = url;
    return self;
}

@end
