
/*
     File: SectionHeaderView.m
 Abstract: A view to display a section header, and support opening and closing a section.
 
  Version: 1.1
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2010 Apple Inc. All Rights Reserved.
 
 */

#import "SectionHeaderView.h"
#import <QuartzCore/QuartzCore.h>

@implementation SectionHeaderView


@synthesize titleLabel, disclosureButton, delegate, section;


+ (Class)layerClass {
    
    return [CAGradientLayer class];
}


-(id)initWithFrame:(CGRect)frame title:(NSString*)title section:(NSInteger)sectionNumber delegate:(id <SectionHeaderViewDelegate>)aDelegate {
    
    self = [super initWithFrame:frame];
    
    if (self != nil) {
        
        // Set up the tap gesture recognizer.
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleOpen:)];
        [self addGestureRecognizer:tapGesture];
        [tapGesture release];

        delegate = aDelegate;        
        self.userInteractionEnabled = YES;
        
        
        // Create and configure the title label.
        section = sectionNumber;
        CGRect titleLabelFrame = self.bounds;
        titleLabelFrame.origin.x += 35.0;
        titleLabelFrame.size.width -= 35.0;
        CGRectInset(titleLabelFrame, 0.0, 5.0);
        titleLabel = [[UILabel alloc] initWithFrame:titleLabelFrame];
        titleLabel.text = title;
        titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:titleLabel];
        
        
        // Create and configure the disclosure button.
        disclosureButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
        disclosureButton.frame = CGRectMake(5.0,  15.0, 20.0, 20.0);
        [disclosureButton setImage:[UIImage imageNamed:@"disclosureIcon.png"] forState:UIControlStateNormal];
        [disclosureButton setImage:[UIImage imageNamed:@"disclosureIcon_down.png"] forState:UIControlStateSelected];
        [disclosureButton addTarget:self action:@selector(toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:disclosureButton];
        
        // Set the colors for the gradient layer.
        static NSMutableArray *colors = nil;
//        UIView *goldenColor = [[UIView alloc] init];
//        goldenColor.backgroundColor = [UIColor colorWithRed:0.824 green:0.749    blue:0.553 alpha:0.70];
//        cell.selectedBackgroundView = goldenColor;
        if (colors == nil) {
            colors = [[NSMutableArray alloc] initWithCapacity:3];
            UIColor *color = nil;
            color = [UIColor colorWithRed:0.824 green:0.749    blue:0.553 alpha:0.70];
            [colors addObject:(id)[color CGColor]];
            color = [UIColor colorWithRed:0.824 green:0.749    blue:0.553 alpha:0.70];
            [colors addObject:(id)[color CGColor]];
            color = [UIColor colorWithRed:0.824 green:0.749    blue:0.553 alpha:0.70];
            [colors addObject:(id)[color CGColor]];
        }
        [(CAGradientLayer *)self.layer setColors:colors];
        [(CAGradientLayer *)self.layer setLocations:[NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.48], [NSNumber numberWithFloat:1.0], nil]];
        
    }
    
    return self;
}


-(IBAction)toggleOpen:(id)sender {
    
    [self toggleOpenWithUserAction:YES];
}


-(void)toggleOpenWithUserAction:(BOOL)userAction {
    
    // Toggle the disclosure button state.
    disclosureButton.selected = !disclosureButton.selected;
    
    // If this was a user action, send the delegate the appropriate message.
    if (userAction) {
        if (disclosureButton.selected) {
            if ([delegate respondsToSelector:@selector(sectionHeaderView:sectionOpened:)]) {
                [delegate sectionHeaderView:self sectionOpened:section];
            }
        }
        else {
            if ([delegate respondsToSelector:@selector(sectionHeaderView:sectionClosed:)]) {
                [delegate sectionHeaderView:self sectionClosed:section];
            }
        }
    }
}


- (void)dealloc {
    
    [titleLabel release];
    [disclosureButton release];
    [super dealloc];
}


@end
