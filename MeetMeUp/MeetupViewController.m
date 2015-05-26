
#import "MeetupViewController.h"

@interface MeetupViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSDictionary *events;
@property NSArray *results;

@end

@implementation MeetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.events = [NSDictionary new];
    self.results = [NSArray new];

    NSURL *url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=91404&text=mobile&time=,1w&key=202319351e53624c24b661e3f521916"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.events = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.results = [self.events objectForKey:@"results"];
        [self.tableView reloadData];
    }];
}

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

@end
