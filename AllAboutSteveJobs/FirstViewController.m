//
//  FirstViewController.m
//  AllAboutSteveJobs
//
//  Created by Dice on 14/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

#import "TimelineViewController.h"

#import "ShortBioViewController.h"

#import "TableViewController.h"

#import "CustomTableCell.h"

#import "Play.h"

#import "Quotation.h"

#import <QuartzCore/QuartzCore.h>

#define		FIRST_VC_TITLE_ARRAY	[NSArray arrayWithObjects:@"Timeline", @"Short Biography", @"Quotes and Sayings",@"Remembering Steve", nil]

#define		FIRST_VC_IMAGE_ARRAY	[NSArray arrayWithObjects:@"Timeline.png", @"ShortBio.png", @"QuotesIcon.png", nil]

@interface FirstViewController ()

@property (nonatomic, retain) NSArray *plays;
- (void)setUpPlaysArray;

@end

@implementation FirstViewController

@synthesize plays=plays_;



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

    self.navigationItem.title = @"Bio";
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
    //self.tabBarItem.image = [UIImage imageNamed:@"info_30.png"];

    //self.tabBarController.tabBarItem.image =  [UIImage imageNamed:@"administrator_star.png"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)setUpPlaysArray {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"PlaysAndQuotations" withExtension:@"plist"];
    NSArray *playDictionariesArray = [[NSArray alloc ] initWithContentsOfURL:url];
    NSMutableArray *playsArray = [NSMutableArray arrayWithCapacity:[playDictionariesArray count]];
    
    for (NSDictionary *playDictionary in playDictionariesArray) {
        
        Play *play = [[Play alloc] init];
        play.name = [playDictionary objectForKey:@"playName"];
        
        NSArray *quotationDictionaries = [playDictionary objectForKey:@"quotations"];
        NSMutableArray *quotations = [NSMutableArray arrayWithCapacity:[quotationDictionaries count]];
        
        for (NSDictionary *quotationDictionary in quotationDictionaries) {
            
            Quotation *quotation = [[Quotation alloc] init];
            [quotation setValuesForKeysWithDictionary:quotationDictionary];
            
            [quotations addObject:quotation];
            //[quotation release];
        }
        play.quotations = quotations;
        
        [playsArray addObject:play];
        //[play release];
    }
    
    self.plays = playsArray;
    //[playDictionariesArray release];
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
    return 3;
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
    //
    cell.customTextView.text = [FIRST_VC_TITLE_ARRAY objectAtIndex:indexPath.row];
    cell.customImageView.image = [UIImage imageNamed:[FIRST_VC_IMAGE_ARRAY objectAtIndex:indexPath.row]];
    
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
    if (indexPath.row == 0) {
             TimelineViewController *detailViewController = [[TimelineViewController alloc] initWithNibName:@"TimelineViewController" bundle:nil];
        [self.navigationController pushViewController:detailViewController animated:YES];
    }
    else if (indexPath.row == 1){
        ShortBioViewController *detailViewController = [[ShortBioViewController alloc] initWithNibName:@"ShortBioViewController" bundle:nil];
        [self.navigationController pushViewController:detailViewController animated:YES];
    }
    else if (indexPath.row == 2){
        
        [self setUpPlaysArray];
        
        TableViewController* aTableViewController = [[TableViewController alloc] initWithStyle:UITableViewStyleGrouped];
        aTableViewController.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        aTableViewController.plays = self.plays;
        [self.navigationController pushViewController:aTableViewController animated:YES];
    }

     // ...
     // Pass the selected object to the new view controller.
    
}

@end
