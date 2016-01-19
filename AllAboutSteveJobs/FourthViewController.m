//
//  FourthViewController.m
//  AllAboutSteveJobs
//
//  Created by Dice on 14/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FourthViewController.h"
#import "CustomTableCell.h"
#import <QuartzCore/QuartzCore.h>
#import "VideoThumbViewController.h"

#define		FOURTH_VC_IMAGE_ARRAY	[NSArray arrayWithObjects:@"Steve_tricks.png", @"Steve_favourites.png", @"Stevenglish.png",@"Steve_Jokes.png",@"Watching_steve.png", nil]

#define		FOURTH_VC_NAME_ARRAY	[NSArray arrayWithObjects:@"Steve's Tricks", @"Steve's Favourites", @"Stevenglish",@"Steve's Jokes",@"Watching Steve", nil]

#define		FOURTH_VC_URL_ARRAY1	[NSArray arrayWithObjects:@"http://www.youtube.com/watch?v=r8L39UwOS-Y",@"http://www.youtube.com/watch?v=qmPq00jelpc", @"http://www.youtube.com/watch?v=tzTQqDrmZ70",@"http://www.youtube.com/watch?v=GCZgqoQSGu4", nil]

#define		FOURTH_VC_URL_ARRAY2	[NSArray arrayWithObjects:@"http://www.youtube.com/watch?v=V9W7SHDtRz4", @"http://www.youtube.com/watch?v=8CBkEfNx1bs", @"http://www.youtube.com/watch?v=NY9p52Shn9g",@"http://www.youtube.com/watch?v=EQcEqhNt5c8", nil]

#define		FOURTH_VC_URL_ARRAY3	[NSArray arrayWithObjects:@"http://www.youtube.com/watch?v=xTuRoHid8d4", @"http://www.youtube.com/watch?v=Pdro3BOb6w0", @"http://www.youtube.com/watch?v=d58gOhxhgzM",@"http://www.youtube.com/watch?v=Pdro3BOb6w0", nil]

#define		FOURTH_VC_URL_ARRAY4	[NSArray arrayWithObjects:@"http://www.youtube.com/watch?v=FrdiU5Tq6X0", @"http://www.youtube.com/watch?v=1aMkynfmIGs", @"http://www.youtube.com/watch?v=laVQjaH9enI",@"http://www.youtube.com/watch?v=5R_xanepOQQ", nil]

#define		FOURTH_VC_URL_ARRAY5	[NSArray arrayWithObjects:@"http://www.youtube.com/watch?v=SMnFYjifc9c", @"http://www.youtube.com/watch?v=jj6q_z2Ni9M", @"http://www.youtube.com/watch?v=NM9FWkiam98",@"http://www.youtube.com/watch?v=qQG0XfU-bFs", nil]



@implementation FourthViewController

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
    self.navigationItem.title = @"Movies";
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
    self.navigationItem.titleView = label;    // Uncomment the following line to preserve selection between presentations.
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
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCell";
	
    CustomTableCell *cell = (CustomTableCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil];
		
		for (id currentObject in topLevelObjects){
			if ([currentObject isKindOfClass:[UITableViewCell class]]){
				cell =  (CustomTableCell *) currentObject;
				break;
            }
        }
    } 
    // Configure the cell...
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background_Black_shelve.jpg"]];
    cell.customImageView.layer.cornerRadius = 5.0;
    cell.customImageView.layer.masksToBounds = YES;
    //And to add a border
    cell.customImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.customImageView.layer.borderWidth = 0.5;
    
    //Configure acc btn.
    UIButton *myAccessoryButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
    [myAccessoryButton setBackgroundColor:[UIColor clearColor]];
    [myAccessoryButton setImage:[UIImage imageNamed:@"disclosureIcon.png"] forState:UIControlStateNormal];
    [cell setAccessoryView:myAccessoryButton];
    
    UIView *goldenColor = [[UIView alloc] init];
    goldenColor.backgroundColor = [UIColor colorWithRed:0.824 green:0.749    blue:0.553 alpha:0.70];
    cell.selectedBackgroundView = goldenColor;
    
    cell.customTextView.text = [FOURTH_VC_NAME_ARRAY objectAtIndex:indexPath.row];
    cell.customImageView.image = [UIImage imageNamed:[FOURTH_VC_IMAGE_ARRAY objectAtIndex:indexPath.row]];
    
    // Configure the cell...
    
    return cell;
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
    
    VideoThumbViewController *detailViewController;
    
    if (indexPath.row == 0 ) {
            detailViewController = [[VideoThumbViewController alloc] initWithTitle:[FOURTH_VC_NAME_ARRAY objectAtIndex:indexPath.row] URL:FOURTH_VC_URL_ARRAY1];
    }
    else if (indexPath.row == 1 ) {
        detailViewController = [[VideoThumbViewController alloc] initWithTitle:[FOURTH_VC_NAME_ARRAY objectAtIndex:indexPath.row] URL:FOURTH_VC_URL_ARRAY2];
    }
    else if (indexPath.row == 2 ) {
        detailViewController = [[VideoThumbViewController alloc] initWithTitle:[FOURTH_VC_NAME_ARRAY objectAtIndex:indexPath.row] URL:FOURTH_VC_URL_ARRAY3];
    }
    else if (indexPath.row == 3 ) {
        detailViewController = [[VideoThumbViewController alloc] initWithTitle:[FOURTH_VC_NAME_ARRAY objectAtIndex:indexPath.row] URL:FOURTH_VC_URL_ARRAY4];
    }
    else if (indexPath.row == 4 ) {
        detailViewController = [[VideoThumbViewController alloc] initWithTitle:[FOURTH_VC_NAME_ARRAY objectAtIndex:indexPath.row] URL:FOURTH_VC_URL_ARRAY5];
    }

    
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     
}

@end
