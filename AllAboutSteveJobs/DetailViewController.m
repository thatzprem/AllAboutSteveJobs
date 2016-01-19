//
//  ShortBioDetailViewController.m
//  AllAboutSteveJobs
//
//  Created by Dice on 14/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation DetailViewController
@synthesize imageView = _imageView;
@synthesize imageViewName = _imageViewName;
@synthesize scrollView = _scrollView;
@synthesize indexNumber = _indexNumber;
@synthesize descriptionDataArray = _descriptionDataArray;
@synthesize headingdataArray = _headingdataArray;
@synthesize textLabel = _textLabel;
@synthesize headinglabel = _headinglabel;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil title:(NSString *)title image:(NSString *)image indexNumber:(int)indexNumber loadFileDetect :(int)loadFileDetect
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    self.indexNumber = indexNumber;
    self.navigationItem.title = title;
    self.imageViewName = image;
    

    
    //Additional tasks
    if (loadFileDetect == 10) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ShortBio" ofType:@"txt"];
        NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
        self.descriptionDataArray = (NSMutableArray*)[string componentsSeparatedByString:@"|"];
        
        NSString *headingPath = [[NSBundle mainBundle] pathForResource:@"ShortBio_heading" ofType:@"txt"];
        NSString *headingString = [NSString stringWithContentsOfFile:headingPath encoding:NSUTF8StringEncoding error:NULL]; 
        self.headingdataArray = (NSMutableArray*)[headingString componentsSeparatedByString:@"|"];
    }
    else if (loadFileDetect == 0){
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"OnStage" ofType:@"txt"];
        NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
        self.descriptionDataArray = (NSMutableArray*)[string componentsSeparatedByString:@"|"];
        
        NSString *headingPath = [[NSBundle mainBundle] pathForResource:@"OnStageTitle" ofType:@"txt"];
        NSString *headingString = [NSString stringWithContentsOfFile:headingPath encoding:NSUTF8StringEncoding error:NULL]; 
        self.headingdataArray = (NSMutableArray*)[headingString componentsSeparatedByString:@"|"];   
    }
    else if (loadFileDetect == 1){
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"AtWork" ofType:@"txt"];
        NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
        self.descriptionDataArray = (NSMutableArray*)[string componentsSeparatedByString:@"|"];
        
        NSString *headingPath = [[NSBundle mainBundle] pathForResource:@"AtWorkTitle" ofType:@"txt"];
        NSString *headingString = [NSString stringWithContentsOfFile:headingPath encoding:NSUTF8StringEncoding error:NULL]; 
        self.headingdataArray = (NSMutableArray*)[headingString componentsSeparatedByString:@"|"];   
    }
    else if (loadFileDetect == 2){
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"AtHome" ofType:@"txt"];
        NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
        self.descriptionDataArray = (NSMutableArray*)[string componentsSeparatedByString:@"|"];
        
        NSString *headingPath = [[NSBundle mainBundle] pathForResource:@"AtHomeTitle" ofType:@"txt"];
        NSString *headingString = [NSString stringWithContentsOfFile:headingPath encoding:NSUTF8StringEncoding error:NULL]; 
        self.headingdataArray = (NSMutableArray*)[headingString componentsSeparatedByString:@"|"];   
    }
    


    
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background_Black_Apple.jpg"]];
    
    CGRect frame = CGRectMake(0, 0, 400, 44);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    NSString* fontName = @"Thonburi-Bold";
    
    //label.font = [UIFont boldSystemFontOfSize:20.0];
    [label setFont:[UIFont fontWithName:fontName size:24]];
    
    label.textAlignment = UITextAlignmentLeft;
    label.textColor = [UIColor whiteColor];
    label.text = self.navigationItem.title;
    // emboss in the same way as the native title
    [label setShadowColor:[UIColor darkGrayColor]];
    [label setShadowOffset:CGSizeMake(0, -0.5)];
    self.navigationItem.titleView = label;
    
    self.scrollView.contentSize = CGSizeMake(130, 850);
    [self.scrollView flashScrollIndicators];
    
    self.imageView.layer.cornerRadius = 10.0;
    self.imageView.layer.masksToBounds = YES;
    //And to add a border
    self.imageView.layer.borderColor = [UIColor colorWithRed:0.824 green:0.749    blue:0.553 alpha:0.70].CGColor;
    self.imageView.layer.borderWidth = 0.5;
    self.imageView.image = [UIImage imageNamed:self.imageViewName];
    self.textLabel.text = [self.descriptionDataArray objectAtIndex:self.indexNumber];
    self.headinglabel.text = [self.headingdataArray objectAtIndex:self.indexNumber];
    


    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
