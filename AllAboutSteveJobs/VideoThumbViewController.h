//
//  TestViewController.h
//
//  Copyright iPhoneDevTips.com All rights reserved.
//

#import <UIKit/UIKit.h>
	
@class YouTubeView;
 
@interface VideoThumbViewController : UIViewController
{
	YouTubeView		*youTubeView;

    
}

@property (nonatomic,strong) NSString *titleName;
@property (nonatomic,retain) NSArray *Url;

- (id)initWithTitle:(NSString *)titleLabel URL:(NSArray*)URL;

@end

