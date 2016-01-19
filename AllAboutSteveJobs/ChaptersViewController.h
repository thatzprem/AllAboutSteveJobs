//
//  ChaptersViewController.h
//  SnowFall
//
//  Created by Dice on 15/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReaderMainToolbar.h"
#import "ChapterToolBar.h"

@interface ChaptersViewController : UIViewController <UIGestureRecognizerDelegate, chapterToolbarDelegate,UITableViewDataSource,UITableViewDelegate>{
    
}
@property(nonatomic,retain) IBOutlet UIButton *chapter1;
@property(nonatomic,retain) IBOutlet UILabel  *chooseChapterLabel;
@property(nonatomic,retain) IBOutlet UIScrollView *chapterScrollView;
@property(nonatomic,retain) IBOutlet UIView *chapterScrollViewContent;
@property(nonatomic,retain) ChapterToolBar *mainToolbar;
@property(nonatomic,retain) UINavigationController *navigationViewController;
@property (nonatomic, assign, readwrite) id <chapterToolbarDelegate> delegate;

- (void)dismissModalView;
-(void)displayMainToolBar;
- (void) modifyCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;


@end
