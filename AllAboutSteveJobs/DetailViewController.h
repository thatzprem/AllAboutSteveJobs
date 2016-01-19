//
//  ShortBioDetailViewController.h
//  AllAboutSteveJobs
//
//  Created by Dice on 14/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property(nonatomic,retain)IBOutlet UIImageView *imageView;
@property(nonatomic,retain)NSString *imageViewName;
@property(nonatomic,retain)IBOutlet UIScrollView *scrollView;
@property(nonatomic) int indexNumber;
@property(nonatomic,retain) NSMutableArray *descriptionDataArray;
@property(nonatomic,retain) NSMutableArray *headingdataArray;
@property(nonatomic,retain)IBOutlet UILabel *textLabel;
@property(nonatomic,retain)IBOutlet UILabel *headinglabel;










- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil title:(NSString *)title image:(NSString *)image indexNumber:(int)indexNumber loadFileDetect :(int)loadFileDetect;





@end
