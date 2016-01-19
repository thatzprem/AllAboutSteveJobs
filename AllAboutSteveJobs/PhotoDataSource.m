//
//  PhotoDataSource.m
//  ReallyBigPhotoLibrary
//
//  Created by Kirby Turner on 9/14/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "PhotoDataSource.h"


@implementation PhotoDataSource

- (void)dealloc
{
   [data_ release], data_ = nil;
   [super dealloc];
}

- (id)init
{
   self = [super init];
   if (self) {
      data_ = [[NSMutableArray alloc] init];
//      NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"Section1_1.jpg"], @"thumbnail", [UIImage imageNamed:@"Section1_1_HD.jpg"], @"fullsize", nil];
//       [data_ addObject:dict1];
//
//       
//      NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"Section1_2.jpg"], @"thumbnail", [UIImage imageNamed:@"Section1_2_HD.jpg"], @"fullsize", nil];
//       [data_ addObject:dict2]; 
//       
//       NSDictionary *dict3 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"Section1_3.jpg"], @"thumbnail", [UIImage imageNamed:@"Section1_3_HD.jpg"], @"fullsize", nil];
//       [data_ addObject:dict3];
//       
//       NSDictionary *dict4 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"Section1_4.jpg"], @"thumbnail", [UIImage imageNamed:@"Section1_4_HD.jpg"], @"fullsize", nil];
//       [data_ addObject:dict4];
//       
//       NSDictionary *dict5 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"Section1_5.jpg"], @"thumbnail", [UIImage imageNamed:@"Section1_5_HD.jpg"], @"fullsize", nil];
//       [data_ addObject:dict5];
//       
//       NSDictionary *dict6 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"Section1_6.jpg"], @"thumbnail", [UIImage imageNamed:@"Section1_6_HD.jpg"], @"fullsize", nil];
//       [data_ addObject:dict6];
//       
//       NSDictionary *dict7 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"Section1_7.jpg"], @"thumbnail", [UIImage imageNamed:@"Section1_7_HD.jpg"], @"fullsize", nil];
//       [data_ addObject:dict7];
//       
//       NSDictionary *dict8 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"Section1_8.jpg"], @"thumbnail", [UIImage imageNamed:@"Section1_8_HD.jpg"], @"fullsize", nil];
//       [data_ addObject:dict8];
       
       for (int j = 1; j <= 8; j++) {
        
           for (int i = 1; i<=8; i++) {
           
               NSString *localString = [[NSString alloc] init];
               
               localString = [NSString stringWithString:@"Section"];
               localString = [localString stringByAppendingFormat:@"%d_",j];
               localString = [localString stringByAppendingFormat:@"%d",i];
               if (j >= 5)
                   localString = [localString stringByAppendingString:@".png"];
               else 
                   localString = [localString stringByAppendingString:@".jpg"];
               NSString *localString_HD = [localString stringByAppendingString:@"_HD.jpg"];
               NSLog(@"%@",localString);

               NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:localString], @"thumbnail", [UIImage imageNamed:localString_HD], @"fullsize", nil];
               [data_ addObject:dict1];
           }
       }
       
       

       
   }
   return self;
}

- (NSInteger)numberOfPhotos
{
   NSInteger count = [data_ count];
   return count;
}

// Implement either these, for synchronous images…
- (UIImage *)imageAtIndex:(NSInteger)index
{
    
   NSDictionary *dict = [data_ objectAtIndex:index];
   UIImage *image = [dict objectForKey:@"fullsize"];
   return image;
}

- (UIImage *)thumbImageAtIndex:(NSInteger)index
{    
    NSDictionary *dict = [data_ objectAtIndex:index];
    UIImage *image = [dict objectForKey:@"thumbnail"];
    return image;
}


@end
