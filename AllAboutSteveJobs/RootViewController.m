//
//  RootViewController.m
//  ReallyBigPhotoLibrary
//
//  Created by Kirby Turner on 9/14/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "RootViewController.h"
#import "PhotoDataSource.h"


@implementation RootViewController

- (void)dealloc 
{
   [data_ release], data_ = nil;
   [super dealloc];
}


#pragma mark -
#pragma mark View lifecycle

- (PhotoDataSource *)data
{
   if (data_) {
      return data_;
   }
   
   data_ = [[PhotoDataSource alloc] init];
   return data_;
}

- (void)viewDidLoad 
{
   [super viewDidLoad];
   
   [self setDataSource:[self data]];
   //[self setTitle:[NSString stringWithFormat:@"%i Photos", [data_ numberOfPhotos]]];

    self.navigationItem.title = @"Pictures";
    CGRect frame = CGRectMake(0, 0, 400, 44);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    NSString* fontName = @"Thonburi-Bold";
    
    //label.font = [UIFont boldSystemFontOfSize:20.0];
    [label setFont:[UIFont fontWithName:fontName size:24]];
    
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = self.navigationItem.title;
    // emboss in the same way as the native title
    [label setShadowColor:[UIColor darkGrayColor]];
    [label setShadowOffset:CGSizeMake(0, -0.5)];
    self.navigationItem.titleView = label;    
   // Label back button as "Back".
   UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Back", @"Back button title") style:UIBarButtonItemStylePlain target:nil action:nil];
   [[self navigationItem] setBackBarButtonItem:backButton];
   [backButton release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}



#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload 
{
   // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
   // For example: self.myOutlet = nil;
}




@end

