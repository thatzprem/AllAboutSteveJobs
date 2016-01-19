//
//  TestViewController.m
//
//  Copyright iPhoneDevTips.com All rights reserved.
//

#import "VideoThumbViewController.h"
#import "YouTubeView.h"

@implementation VideoThumbViewController
@synthesize titleName = _titleName;
@synthesize Url = _Url;



- (id)initWithTitle:(NSString *)titleLabel URL:(NSArray*)URL{
    
    self.titleName = titleLabel;
    self.Url = URL;
    
    return self;

}



- (void)viewDidLoad 
{
	[super viewDidLoad];

    self.title = self.titleName;

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background_Black.jpg"]];
    //self.title=@"Videos";

    
	// Create view that will act as link to youtube video,
  // centering the view 
	youTubeView = [[YouTubeView alloc] initWithStringAsURL:[self.Url objectAtIndex:0] frame:CGRectMake(20, 50, 120, 120)];
	[[self view] addSubview:youTubeView];
    
   // NSLog(@"%@",[self.Url objectAtIndex:1]);
    
    youTubeView = [[YouTubeView alloc] initWithStringAsURL:[self.Url objectAtIndex:1] frame:CGRectMake(170, 50, 120, 120)];
	[[self view] addSubview:youTubeView];
    
    youTubeView = [[YouTubeView alloc] initWithStringAsURL:[self.Url objectAtIndex:2] frame:CGRectMake(20, 200, 120, 120)];
	[[self view] addSubview:youTubeView];
    
    youTubeView = [[YouTubeView alloc] initWithStringAsURL:[self.Url objectAtIndex:3] frame:CGRectMake(170, 200, 120, 120)];
	[[self view] addSubview:youTubeView];

}

- (void)dealloc 
{

}

@end
