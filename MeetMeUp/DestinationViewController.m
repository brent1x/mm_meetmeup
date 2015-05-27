
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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(UILabel *)sender {
    Event *event = self.event;
    DestinationViewController *destVC = segue.destinationViewController;
    destVC.event = event;
}

@end
