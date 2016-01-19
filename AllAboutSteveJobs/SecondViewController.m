//
//  SecondViewController.m
//  AllAboutSteveJobs
//
//  Created by Dice on 14/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"
#import "OnStageViewController.h"
#import "CustomTableCell.h"
#import "KeyPeopleViewController.h"
#import <QuartzCore/QuartzCore.h>


#define		SECOND_VC_TITLE_ARRAY	[NSArray arrayWithObjects:@"On Stage", @"At Work", @"At Home",@"Key People", nil]

#define		SECOND_VC_IMAGE_ARRAY	[NSArray arrayWithObjects:@"OnStage.png", @"AtWork.png", @"AtHome.png",@"KeyPeople.png", nil]

@implementation SecondViewController

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
    self.navigationItem.title = @"Being Steve";
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
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCell";
	
    CustomTableCell *cell = (CustomTableCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
//		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil];
//		
//		for (id currentObject in topLevelObjects){
//			if ([currentObject isKindOfClass:[UITableViewCell class]]){
//				cell =  (CustomTableCell *) currentObject;
//				break;
//            }
//        }
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

    cell.customTextView.text = [SECOND_VC_TITLE_ARRAY objectAtIndex:indexPath.row];
    cell.customImageView.image = [UIImage imageNamed:[SECOND_VC_IMAGE_ARRAY objectAtIndex:indexPath.row]];
    
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
        
    
    NSArray *nameArray = [[NSArray alloc] init];
    NSArray *imageArray = [[NSArray alloc] init];
    if (indexPath.row == 0||indexPath.row ==1 || indexPath.row == 2) {

        if (indexPath.row == 0) {  
            
            nameArray = [NSArray arrayWithObjects:@"Keynote speeches", @"Reality Distortion", @"Typical gestures", nil];
            imageArray = [NSArray arrayWithObjects:@"KeyNote.png", @"RDF.png", @"Gesture_Small.png", nil];
        }
        
        else if (indexPath.row == 1) {        
            nameArray = [NSArray arrayWithObjects:@"Trouble with Steve", @"Work habits at Apple", @"Influence on Apple",@"Steve at Pixar", nil];
            imageArray = [NSArray arrayWithObjects:@"TroubleWithSteve.png", @"AtWork.png", @"InfluenceAtApple.png",@"AtPixar.png", nil];
        }
        else if (indexPath.row == 2) {  
            
            nameArray = [NSArray arrayWithObjects:@"Family life", @"Food habits", @"Clothing habits",@"Houses",@"Travel", nil];
            imageArray = [NSArray arrayWithObjects:@"FamilyLife.png", @"FoodHabits.png", @"Clothing1.png",@"Houses.png",@"Locomotion.png", nil];
        }
        
        OnStageViewController *detailViewController = [[OnStageViewController alloc] initWithNibName:@"OnStageViewController" bundle:nil titleNameArray:nameArray imageNameArray:imageArray indexPath:indexPath.row title:[SECOND_VC_TITLE_ARRAY objectAtIndex:indexPath.row]];
        [self.navigationController pushViewController:detailViewController animated:YES];
    }
    else {
        
         KeyPeopleViewController *detailViewController = [[KeyPeopleViewController alloc] initWithNibName:@"KeyPeopleViewController" bundle:nil];
         [self.navigationController pushViewController:detailViewController animated:YES];
         
    }
    
     
}

@end
