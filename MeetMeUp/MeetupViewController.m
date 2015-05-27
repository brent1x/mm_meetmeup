
#import "MeetupViewController.h"
#import "Event.h"
#import "DestinationViewController.h"

@interface MeetupViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate>
@property NSDictionary *events;
@property NSArray *results;
@property NSMutableArray *filteredResults;
@property NSMutableArray *arrayOfEvents;
@property (weak, nonatomic) IBOutlet UITableView *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MeetupViewController

#pragma mark // VDL INCLUDING NETWORK CALLS

- (void)viewDidLoad {
    [super viewDidLoad];

    self.events = [NSDictionary new];
    self.results = [NSArray new];
    self.arrayOfEvents = [NSMutableArray new];

    NSURL *url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=91404&text=mobile&time=,1w&key=202319351e53624c24b661e3f521916"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.events = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.results = [self.events objectForKey:@"results"];
        self.filteredResults = [NSMutableArray arrayWithCapacity:[self.results count]];

        for (NSDictionary *dictionaryToPass in self.results) {
            NSString *name = [dictionaryToPass objectForKey:@"name"];
            NSNumber *rsvpCount = [dictionaryToPass objectForKey:@"yes_rsvp_count"];
            NSDictionary *hostGroupInfo = [dictionaryToPass objectForKey:@"group"];
            NSString *eventDescription = [dictionaryToPass objectForKey:@"description"];
            NSString *url = [dictionaryToPass objectForKey:@"event_url"];
            Event *event = [[Event alloc] initWithName:name rsvp:rsvpCount host:hostGroupInfo description:eventDescription url:url];
            [self.arrayOfEvents addObject:event];
        }

        [self.tableView reloadData];
    }];
}

#pragma mark // TABLE VIEW METHODS

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];

    // for cell text, index into results array and grab keys for name
    NSDictionary *individualResult = [self.results objectAtIndex:indexPath.row];
    cell.textLabel.text = [individualResult objectForKey:@"name"];

    // for cell detail text, index into results array > individual result and grab keys for city
    NSDictionary *individualResultLocation = [individualResult objectForKey:@"venue"];
    cell.detailTextLabel.text = [individualResultLocation objectForKey:@"address_1"];

    return cell;
}

#pragma mark // PREPARE FOR SEGUE METHOD

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    Event *event = [self.arrayOfEvents objectAtIndex:indexPath.row];
    DestinationViewController *destVC = segue.destinationViewController;
    destVC.event = event;
}

#pragma mark // SEARCH BAR METHODS

- (void)filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope {
    [self.filteredResults removeAllObjects];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@", searchText];
    self.filteredResults = [NSMutableArray arrayWithArray:[self.results filteredArrayUsingPredicate:predicate]];
}

@end






