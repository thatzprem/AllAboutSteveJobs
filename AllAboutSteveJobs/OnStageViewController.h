//
//  OnStageViewController.h
//  AllAboutSteveJobs
//
//  Created by Dice on 14/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OnStageViewController : UITableViewController

@property(nonatomic,retain) NSArray * titleNamesArray;
@property(nonatomic,retain) NSArray *titleImagesArray;
@property(nonatomic) int loadFileDetect;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil titleNameArray:(NSArray *)titleNameArray imageNameArray:(NSArray *)imageNameArray indexPath:(int)indexPath title:(NSString *)titleName;


@end
