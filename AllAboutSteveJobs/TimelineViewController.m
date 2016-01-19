//
//  TimelineViewController.m
//  AllAboutSteveJobs
//
//  Created by Dice on 14/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimelineViewController.h"
#import "TimelineTableCell.h"

#define		SECTION_TITLE_ARRAY	[NSArray arrayWithObjects:@"1955-1979", @"1980-1989", @"1990-1999", @"2000-2005", @"2006-2010", nil]


@implementation TimelineViewController
@synthesize timelineDataArray = _timelineDataArray;


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
    self.navigationItem.title = @"Timeline";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background_Black_Apple.jpg"]];
    
    CGRect frame = CGRectMake(0, 0, 100, 44);
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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"facts" ofType:@"txt"];
    NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    self.timelineDataArray = (NSMutableArray*)[string componentsSeparatedByString:@"|"]; 

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
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"CustomCell";
	
    TimelineTableCell *cell = (TimelineTableCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"TimelineTableCell" owner:self options:nil];
		
		for (id currentObject in topLevelObjects){
			if ([currentObject isKindOfClass:[UITableViewCell class]]){
				cell =  (TimelineTableCell *) currentObject;
				break;
            }
        }
    }
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background_Black_Apple.jpg"]];
    //cell.customTextView.font = [UIFont fontWithName:@"Thonburi" size:<#(CGFloat)#>];
    
    if (indexPath.section == 0) {
        cell.customTextView.text = [self.timelineDataArray objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 1){   
        cell.customTextView.text = [self.timelineDataArray objectAtIndex:indexPath.row+6];
    }
    else if (indexPath.section == 2){   
        cell.customTextView.text = [self.timelineDataArray objectAtIndex:indexPath.row+12];
    }
    else if (indexPath.section == 3){   
        cell.customTextView.text = [self.timelineDataArray objectAtIndex:indexPath.row+18];
    }
    else if (indexPath.section == 4){   
        cell.customTextView.text = [self.timelineDataArray objectAtIndex:indexPath.row+24];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // Configure the cell...
    
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *sectionHeader = NSLocalizedString([SECTION_TITLE_ARRAY objectAtIndex:section], @"section header");
 	return sectionHeader;
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath: (NSIndexPath *) indexPath {
    return 80.0f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,
                                                                  tableView.bounds.size.width, 22)];
    headerView.backgroundColor = [UIColor clearColor];
	
	UILabel *labelOne = [[UILabel alloc] initWithFrame:CGRectMake
						 (10, 10,  180, 22)];
    labelOne.backgroundColor = [UIColor clearColor]; 
    labelOne.textAlignment = UITextAlignmentLeft;
    labelOne.font = [UIFont boldSystemFontOfSize:18.0];
    labelOne.text =  [[SECTION_TITLE_ARRAY objectAtIndex:section] capitalizedString];
    labelOne.textColor = [UIColor colorWithRed:0.824 green:0.749    blue:0.553 alpha:0.70];
    [headerView addSubview:labelOne];
    return headerView;
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
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
