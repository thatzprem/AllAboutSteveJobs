//
//  ZZGridViewViewController.m
//  ZZGridView
//

//#import "ThirdViewController.h"
#import "Item.h"
#import "CellDetailClass.h"
#import <QuartzCore/QuartzCore.h>


#define		PICTURES_SECTION_TITLE_ARRAY	[NSArray arrayWithObjects:@"1955-1981", @"1982-1985", @"1986-1994", @"1995-1999", @"2000-2003",@"2004-2006",@"2007-2009",@"2010+", nil]


@implementation ThirdViewController

@synthesize tableView, sections, webViewController;
//@synthesize displayViewController = _displayViewController;
@synthesize sectionObjectsArray = _sectionObjectsArray;
//@synthesize indexPathRef;
@synthesize customCell;


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (void) loadView {
	[super loadView];
	self.title=@"Pictures";
	
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background_Black_Apple.jpg"]];
    
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

    
    //----------- LOAD DATA WITH IMAGES FOR EACH SECTION - BEGIN ----------------- 
	
    //Section1
    CellDetailClass *section1 = [[CellDetailClass alloc] init];
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"Section1" ofType:@"txt"];
    NSString *string1 = [NSString stringWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:NULL];
    section1.nameArray = (NSMutableArray*)[string1 componentsSeparatedByString:@"|"];
    
    NSMutableArray *tempMutableArray1 = [[NSMutableArray alloc] init];
    for (int p= 1;p <=[section1.nameArray count]; p++)
        [tempMutableArray1 addObject:[NSString stringWithFormat:@"Section1_%d.jpg",p]];
    section1.imageArray = tempMutableArray1;
    
    
    
    //Section2
    CellDetailClass *section2 = [[CellDetailClass alloc] init];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"Section2" ofType:@"txt"];
    NSString *string2 = [NSString stringWithContentsOfFile:path2 encoding:NSUTF8StringEncoding error:NULL];
    section2.nameArray = (NSMutableArray*)[string2 componentsSeparatedByString:@"|"];
    
    NSMutableArray *tempMutableArray2 = [[NSMutableArray alloc] init];
    for (int p= 1;p <=[section2.nameArray count]; p++)
        [tempMutableArray2 addObject:[NSString stringWithFormat:@"Section2_%d.jpg",p]];
    section2.imageArray = tempMutableArray2; 
    
    CellDetailClass *section3 = [[CellDetailClass alloc] init];
    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"Section3" ofType:@"txt"];
    NSString *string3 = [NSString stringWithContentsOfFile:path3 encoding:NSUTF8StringEncoding error:NULL];
    section3.nameArray = (NSMutableArray*)[string3 componentsSeparatedByString:@"|"];
    
    NSMutableArray *tempMutableArray3 = [[NSMutableArray alloc] init];
    for (int p= 1;p <=[section3.nameArray count]; p++)
        [tempMutableArray3 addObject:[NSString stringWithFormat:@"Section3_%d.jpg",p]];
    section3.imageArray = tempMutableArray3; 
    
    
    CellDetailClass *section4 = [[CellDetailClass alloc] init];
    NSString *path4 = [[NSBundle mainBundle] pathForResource:@"Section4" ofType:@"txt"];
    NSString *string4 = [NSString stringWithContentsOfFile:path4 encoding:NSUTF8StringEncoding error:NULL];
    section4.nameArray = (NSMutableArray*)[string4 componentsSeparatedByString:@"|"];
    
    NSMutableArray *tempMutableArray4 = [[NSMutableArray alloc] init];
    for (int p= 1;p <=[section4.nameArray count]; p++)
        [tempMutableArray4 addObject:[NSString stringWithFormat:@"Section4_%d.jpg",p]];
    section4.imageArray = tempMutableArray4; 
    
    CellDetailClass *section5 = [[CellDetailClass alloc] init];
    NSString *path5 = [[NSBundle mainBundle] pathForResource:@"Section5" ofType:@"txt"];
    NSString *string5 = [NSString stringWithContentsOfFile:path5 encoding:NSUTF8StringEncoding error:NULL];
    section5.nameArray = (NSMutableArray*)[string5 componentsSeparatedByString:@"|"];
    
    NSMutableArray *tempMutableArray5 = [[NSMutableArray alloc] init];
    for (int p= 1;p <=[section5.nameArray count]; p++)
        [tempMutableArray5 addObject:[NSString stringWithFormat:@"Section5_%d.png",p]];
    section5.imageArray = tempMutableArray5; 
    
    CellDetailClass *section6 = [[CellDetailClass alloc] init];
    NSString *path6 = [[NSBundle mainBundle] pathForResource:@"Section6" ofType:@"txt"];
    NSString *string6 = [NSString stringWithContentsOfFile:path6 encoding:NSUTF8StringEncoding error:NULL];
    section6.nameArray = (NSMutableArray*)[string6 componentsSeparatedByString:@"|"];
    
    NSMutableArray *tempMutableArray6 = [[NSMutableArray alloc] init];
    for (int p= 1;p <=[section6.nameArray count]; p++)
        [tempMutableArray6 addObject:[NSString stringWithFormat:@"Section6_%d.png",p]];
    section6.imageArray = tempMutableArray6; 
    
    CellDetailClass *section7 = [[CellDetailClass alloc] init];
    NSString *path7 = [[NSBundle mainBundle] pathForResource:@"Section7" ofType:@"txt"];
    NSString *string7 = [NSString stringWithContentsOfFile:path7 encoding:NSUTF8StringEncoding error:NULL];
    section7.nameArray = (NSMutableArray*)[string7 componentsSeparatedByString:@"|"];
    
    NSMutableArray *tempMutableArray7 = [[NSMutableArray alloc] init];
    for (int p= 1;p <=[section7.nameArray count]; p++)
        [tempMutableArray7 addObject:[NSString stringWithFormat:@"Section7_%d.png",p]];
    section7.imageArray = tempMutableArray7; 
    
    CellDetailClass *section8 = [[CellDetailClass alloc] init];
    NSString *path8 = [[NSBundle mainBundle] pathForResource:@"Section8" ofType:@"txt"];
    NSString *string8 = [NSString stringWithContentsOfFile:path8 encoding:NSUTF8StringEncoding error:NULL];
    section8.nameArray = (NSMutableArray*)[string8 componentsSeparatedByString:@"|"];
    
    NSMutableArray *tempMutableArray8 = [[NSMutableArray alloc] init];
    for (int p= 1;p <=[section8.nameArray count]; p++)
        [tempMutableArray8 addObject:[NSString stringWithFormat:@"Section8_%d.png",p]];
    section8.imageArray = tempMutableArray8; 
    
    
	//
    
    self.sectionObjectsArray = [[NSMutableArray alloc] initWithObjects:section1,section2,section3,section4,section5,section6,section7,section8, nil];
    //----------- LOAD DATA WITH IMAGES FOR EACH SECTION - END ----------------- 

    
    
    
    //----------- PROCESS DATA - BEGIN ------------

	sections = [[NSMutableArray alloc] init];

	for(int s=0;s<[self.sectionObjectsArray count];s++) { // 4 sections
        
        CellDetailClass *tempCellDetailClass = [self.sectionObjectsArray objectAtIndex:s];
        
		NSMutableArray *section = [[NSMutableArray alloc] init];
		for(int i=0;i<[tempCellDetailClass.nameArray count];i++) {  // 12 items in each section 
			Item *item = [[Item alloc] init];
			item.link=@"http://www.google.com";
			item.title=[NSString stringWithFormat:@"%@", [tempCellDetailClass.nameArray objectAtIndex:i]];
			item.image= [tempCellDetailClass.imageArray objectAtIndex:i];
			
			[section addObject:item];			
		}
		[sections addObject:section];
	}
	//----------- PROCESS DATA - END ------------
	//
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	NSLog(@"...section ==== %d", [sections count]);
	return [sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {  
	NSMutableArray *sectionItems = [sections objectAtIndex:indexPath.section];
    
    int numRows;
    //NSLog(@"sectionItems count = %d",[sectionItems count]);

    if (([sectionItems count])%4 != 0) {
        numRows = ([sectionItems count]/4)+1;
    }
    else numRows = ([sectionItems count])/4;
    
    //NSLog(@"numRows = %d",numRows);
    
	return numRows * 80.0;
} 


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	NSString *sectionTitle = [NSString stringWithFormat:@"Section %d", section];
	return sectionTitle;
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
    labelOne.text =  [[PICTURES_SECTION_TITLE_ARRAY objectAtIndex:section] capitalizedString];
    labelOne.textColor = [UIColor colorWithRed:0.824 green:0.749    blue:0.553 alpha:0.70];
    [headerView addSubview:labelOne];
    return headerView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    static NSString *hlCellID;
	
	UITableViewCell *hlcell = [tableView dequeueReusableCellWithIdentifier:hlCellID];
	if(hlcell == nil) {
		hlcell =  [[UITableViewCell alloc] 
								 initWithStyle:UITableViewCellStyleDefault reuseIdentifier:hlCellID];
		hlcell.accessoryType = UITableViewCellAccessoryNone;
		hlcell.selectionStyle = UITableViewCellSelectionStyleNone;
        //[self performSelectorOnMainThread:@selector(backgroundProcess:) withObject:indexPath waitUntilDone:NO];

	}
	
	int section = indexPath.section;

    //indexPathRef = indexPath;
    customCell = hlcell;
   // [self performSelectorInBackground:@selector(backgroundProcess:) withObject:indexPath];
    [self performSelectorOnMainThread:@selector(backgroundProcess:) withObject:indexPath waitUntilDone:YES];
//	NSMutableArray *sectionItems = [sections objectAtIndex:section];
//	
//	int n = [sectionItems count];
//	int i=0,i1=0; 
//	
//	while(i<n){
//		int yy = 4 +i1*74;
//		int j=0;
//		for(j=0; j<4;j++){
//			
//			if (i>=n) break;
//			Item *item = [sectionItems objectAtIndex:i];
//			
//			CGRect rect = CGRectMake(8+75*j, yy+8, 60, 60);
//			UIButton *button=[[UIButton alloc] initWithFrame:rect];
//			[button setFrame:rect];
//			UIImage *buttonImageNormal=[UIImage imageNamed:item.image];
//			[button setBackgroundImage:buttonImageNormal	forState:UIControlStateNormal];
//			[button setContentMode:UIViewContentModeCenter];
//            button.layer.cornerRadius = 10.0;
//            button.layer.masksToBounds = YES;
//            //And to add a border
//            button.layer.borderColor = [UIColor colorWithRed:0.824 green:0.749    blue:0.553 alpha:0.70].CGColor;
//            button.layer.borderWidth = 0.5;
//			
//			NSString *tagValue = [NSString stringWithFormat:@"%d%d", indexPath.section+1, i];
//			button.tag = [tagValue intValue];
//			//NSLog(@"....tag....%d", button.tag);
//			
//			[button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
//            UIView* view0 = [hlcell.contentView viewWithTag:button.tag];
//            if (view0 != nil) {
//                [view0 removeFromSuperview];
//            }
//			[hlcell.contentView addSubview:button];
//			//[button release];
//            
//			UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8+75*j, yy+70, 60, 12)];
//			label.text = item.title;
//			label.textColor = [UIColor whiteColor];
//			label.backgroundColor = [UIColor clearColor];
//			label.textAlignment = UITextAlignmentCenter;
//			//label.font = [UIFont fontWithName:@"ArialMT" size:10]; 
//            label.font = [UIFont boldSystemFontOfSize:10]; 
//            NSString *tagValueLabel = [NSString stringWithFormat:@"%d%d", indexPath.section+500, i];
//			label.tag = [tagValueLabel intValue];
//			//NSLog(@"....tag....%d", label.tag);
//            
//            UIView* view1 = [hlcell.contentView viewWithTag:label.tag];
//            if (view1 != nil) {
//                [view1 removeFromSuperview];
//            }
//			[hlcell.contentView addSubview:label];
//			
//			i++;
//		}
//		i1 = i1+1;
//	}
    
    hlcell.backgroundColor = [UIColor clearColor];

	return hlcell;
}

-(void)backgroundProcess :(NSIndexPath *)indexPathRef{
    
    NSMutableArray *sectionItems = [sections objectAtIndex:indexPathRef.section];
	
	int n = [sectionItems count];
	int i=0,i1=0; 
	
	while(i<n){
		int yy = 4 +i1*74;
		int j=0;
		for(j=0; j<4;j++){
			
			if (i>=n) break;
			Item *item = [sectionItems objectAtIndex:i];
			
			CGRect rect = CGRectMake(8+75*j, yy+8, 60, 60);
			UIButton *button=[[UIButton alloc] initWithFrame:rect];
			[button setFrame:rect];
			UIImage *buttonImageNormal=[UIImage imageNamed:item.image];
			[button setBackgroundImage:buttonImageNormal	forState:UIControlStateNormal];
			[button setContentMode:UIViewContentModeCenter];
            button.layer.cornerRadius = 10.0;
            button.layer.masksToBounds = YES;
            //And to add a border
            button.layer.borderColor = [UIColor colorWithRed:0.824 green:0.749    blue:0.553 alpha:0.70].CGColor;
            button.layer.borderWidth = 0.5;
			
			NSString *tagValue = [NSString stringWithFormat:@"%d%d", indexPathRef.section+1, i];
			button.tag = [tagValue intValue];
			//NSLog(@"....tag....%d", button.tag);
			
			//[button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            UIView* view0 = [customCell.contentView viewWithTag:button.tag];
            if (view0 != nil) {
                [view0 removeFromSuperview];
            }
            //[self performSelectorOnMainThread:@selector(mainProcess1:) withObject:button waitUntilDone:YES];

			[customCell.contentView addSubview:button];
			//[button release];
            
			UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8+75*j, yy+70, 60, 12)];
			label.text = item.title;
			label.textColor = [UIColor whiteColor];
			label.backgroundColor = [UIColor clearColor];
			label.textAlignment = UITextAlignmentCenter;
			//label.font = [UIFont fontWithName:@"ArialMT" size:10]; 
            label.font = [UIFont boldSystemFontOfSize:10]; 
            NSString *tagValueLabel = [NSString stringWithFormat:@"%d%d", indexPathRef.section+500, i];
			label.tag = [tagValueLabel intValue];
			//NSLog(@"....tag....%d", label.tag);
            
            UIView* view1 = [customCell.contentView viewWithTag:label.tag];
            if (view1 != nil) {
                [view1 removeFromSuperview];
            }
			[customCell.contentView addSubview:label];
			//[self performSelectorOnMainThread:@selector(mainProcess2:) withObject:label waitUntilDone:YES];
			i++;
		}
		i1 = i1+1;
	}

        
    
}

- (void)mainProcess1:(UIButton* )obj{
    
    [customCell.contentView addSubview:obj];
    
}

- (void)mainProcess2:(UILabel* )obj{
    
    [customCell.contentView addSubview:obj];
}

//-(IBAction)buttonPressed:(id)sender {
//	int tagId = [sender tag];
//	int divNum = 0;
//	if(tagId<100)
//		divNum=10;
//	else 
//		divNum=100;
//	int section = [sender tag]/divNum;
//	section -=1; // we had incremented at tag assigning time 
//	int itemId = [sender tag]%divNum;
//	
//	
//	NSLog(@"...section = %d, item = %d", section, itemId);
//	
//	NSMutableArray *sectionItems = [sections objectAtIndex:section];
//	Item *item = [sectionItems objectAtIndex:itemId];
//	NSLog(@"..item pressed.....%@, %@", item.title, item.link);
//	
//	if(self.displayViewController == nil) {
//		self.displayViewController = [[DisplayViewController alloc] initWithNibName:@"DisplayViewController" bundle:nil title:item.title imageName:item.image];
//        //self.displayViewController.displayImageView.image = [UIImage imageNamed:item.image];
//	}
//    
//    NSMutableArray *tempArray1 = (NSMutableArray*)[item.image componentsSeparatedByString:@"."];
//    
//    NSString *tempString = (NSString*)[tempArray1 objectAtIndex:0];
//    NSString *tempString1 = [NSString stringWithFormat:@"%@_HD.jpg",tempString];
//        
//	self.displayViewController.displayImageView.image = [UIImage imageNamed:tempString1];
//    self.displayViewController.displayLabel.text = item.title;
//    self.displayViewController.titleLabel = item.title;
//   
//    CellDetailClass *localCellDetailClass = (CellDetailClass*)[self.sectionObjectsArray objectAtIndex:section];
//    NSLog(@"%@", [localCellDetailClass.imageArray objectAtIndex:1]);
//    self.displayViewController.imageNameArray = localCellDetailClass.imageArray;
//    self.displayViewController.titleNameArray = localCellDetailClass.nameArray;
//    self.displayViewController.selectedImageNumberInSection = itemId;
//    
//	[self.navigationController pushViewController:self.displayViewController animated:YES];
//
//}





- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
//    [super dealloc];
//	[sections release];
//	[tableView release];
//	[webViewController release];
}

@end
