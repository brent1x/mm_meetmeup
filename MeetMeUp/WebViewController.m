
#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Info";
    [self loadRequestWithText:self.event.url];
}

- (void)loadRequestWithText:(NSString *)text{
    NSURL *url = [NSURL URLWithString:text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (IBAction)onDismissButtonPressed:(UIButton *)sender {
    [self.presentingViewController dismissViewControllerAnimated:true completion:nil];
}


@end
