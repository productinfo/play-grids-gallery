//
//  GridsGalleryCertificationCell.m
//  GridsGallery
//
//  Created by Daniel Allsop on 28/10/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "GridsGalleryCertificationCell.h"

@implementation GridsGalleryCertificationCell

- (void)setCertification:(NSString *)certification {
  
  UITextField *certificateRating = [UITextField new];
  certificateRating .font = [UIFont fontWithName:@"Superclarendon-Black" size:30];
  certificateRating .text = certification;
  [self addSubview:certificateRating ];
  
  UILabel *certificateDescription = [UILabel new];
  certificateDescription.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
  certificateDescription.textAlignment = NSTextAlignmentCenter;
  certificateDescription.lineBreakMode = NSLineBreakByWordWrapping;
  certificateDescription.numberOfLines = 3;
  [self addSubview:certificateDescription];
  
  if ([certification isEqualToString:@"G"]) {
    certificateRating .textColor =[UIColor colorWithRed:1.0f/255 green:106.0f/255 blue:49.0f/255 alpha:1];
    certificateDescription.text = @"GENERAL\nAUDIENCES";
  } else if ([certification isEqualToString:@"PG"]) {
    certificateRating .textColor = [UIColor colorWithRed:242.0f/255 green:90.0f/255 blue:56.0f/255 alpha:1];
    certificateDescription.text = @"PARENTAL\nGUIDANCE\nSUGGESTED";
    
  } else if ([certification isEqualToString:@"PG-13"]) {
    certificateRating .textColor = [UIColor colorWithRed:118.0f/255 green:64.0f/255 blue:146.0f/255 alpha:1];
    certificateDescription.text = @"PARENTS\nSTRONGLY\nCAUTIONED";
  }
  
  [certificateRating sizeToFit];
  [certificateDescription sizeToFit];
  
  certificateRating.center = CGPointMake(80, 22);
  certificateDescription.center = CGPointMake(170, 22);
  
  certificateDescription.frame = CGRectIntegral(certificateDescription.frame);
}

- (void)resetForReuse {
  [super resetForReuse];
  for (UIView *subview in self.subviews) {
    [subview removeFromSuperview];
  }
}

@end