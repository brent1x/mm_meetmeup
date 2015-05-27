//
//  DestinationViewController.m
//  MeetMeUp
//
//  Created by Brent Dady on 5/26/15.
//  Copyright (c) 2015 Brent Dady. All rights reserved.
//

#import "DestinationViewController.h"

@interface DestinationViewController ()
@property (weak, nonatomic) IBOutlet UILabel *eventName;
@property (weak, nonatomic) IBOutlet UILabel *rsvpCount;
@property (weak, nonatomic) IBOutlet UILabel *hostingGroupInfo;
@property (weak, nonatomic) IBOutlet UITextField *eventDescription;
@property (weak, nonatomic) IBOutlet UILabel *url;

@end

@implementation DestinationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.eventName.text = self.event.name;
    self.rsvpCount.text = [self.event.rsvpCount description];
    self.hostingGroupInfo.text = [self.event.hostGroupInfo objectForKey:@"name"];
    self.eventDescription.text = self.event.eventDescription;
    self.url.text = self.event.url;

}

@end
