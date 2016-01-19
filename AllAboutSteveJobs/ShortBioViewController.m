//
//  ShortBioViewController.m
//  AllAboutSteveJobs
//
//  Created by Dice on 14/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShortBioViewController.h"
#import "DetailViewController.h"
#import "CustomTableCell.h"
#import <QuartzCore/QuartzCore.h>


#define		ROW_TITLE_ARRAY	[NSArray arrayWithObjects:@"Youth", @"Apple’s early years", @"Macintosh", @"The NeXT years", @"Comeback",@"Apple back on track",@"The iPod revolution",@"Pixar-Disney merger",@"Apple Inc", nil]

#define		SHORT_BIO_IMAGE_ARRAY	[NSArray arrayWithObjects:@"1_HD.png", @"2_HD.png", @"3_HD.png", @"4_HD.png", @"5_HD.png",@"6_HD.png",@"7_HD.png",@"8_HD.png",@"9_HD.png", nil]

@implementation ShortBioViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
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
    self.navigationItem.title = @"Short Bio";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background_Black_Apple.jpg"]];

    CGRect frame = CGRectMake(0, 0, 200, 44);
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
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [ROW_TITLE_ARRAY count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier;
    //= @"CustomCell";

    CustomTableCell *cell = (CustomTableCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
		cell = [[[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil] lastObject];
        cell.backgroundColor = [UIColor clearColor];
        cell.customImageView.layer.cornerRadius = 5.0;
        cell.customImageView.layer.masksToBounds = YES;
        //And to add a border
        cell.customImageView.layer.borderColor = [UIColor colorWithRed:0.824 green:0.749    blue:0.553 alpha:0.70].CGColor;
        cell.customImageView.layer.borderWidth = 0.5;
        
        //Configure acc btn.
        UIButton *myAccessoryButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
        [myAccessoryButton setBackgroundColor:[UIColor clearColor]];
        [myAccessoryButton setImage:[UIImage imageNamed:@"disclosureIcon.png"] forState:UIControlStateNormal];
        [cell setAccessoryView:myAccessoryButton];
        
        UIView *goldenColor = [[UIView alloc] init];
        goldenColor.backgroundColor = [UIColor colorWithRed:0.824 green:0.749    blue:0.553 alpha:0.70];
        cell.selectedBackgroundView = goldenColor;
    }
    
    cell.customTextView.text = [ROW_TITLE_ARRAY objectAtIndex:indexPath.row];
    cell.customImageView.image =[UIImage imageNamed:[SHORT_BIO_IMAGE_ARRAY objectAtIndex:indexPath.row]];
    
    
    // Configure the cell...
    
    return (UITableViewCell*) cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath: (NSIndexPath *) indexPath {
    return 80.0f;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil title:[ROW_TITLE_ARRAY objectAtIndex:indexPath.row] image:[SHORT_BIO_IMAGE_ARRAY objectAtIndex:indexPath.row]indexNumber:indexPath.row loadFileDetect:10];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     
}

@end
