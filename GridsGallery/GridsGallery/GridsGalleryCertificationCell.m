//
//  GridsGalleryCertificationCell.m
//  GridsGallery
//
//  Created by Daniel Allsop on 28/10/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "GridsGalleryCertificationCell.h"

@interface GridsGalleryCertificationCell ()

@property UILabel *certificateRating;
@property UILabel *certificateDescription;

@end

@implementation GridsGalleryCertificationCell

-(id)initWithReuseIdentifier:(NSString *)identifier {
  if (self = [super initWithReuseIdentifier:identifier]) {
    self.certificateRating = [UILabel new];
    self.certificateRating.font = [UIFont fontWithName:@"Superclarendon-Black" size:30];
    [self addSubview:self.certificateRating];
    
    self.certificateDescription = [UILabel new];
    self.certificateDescription.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
    self.certificateDescription.textAlignment = NSTextAlignmentCenter;
    self.certificateDescription.lineBreakMode = NSLineBreakByWordWrapping;
    self.certificateDescription.numberOfLines = 3;
    [self addSubview:self.certificateDescription];
  }
  return self;
}

- (void)setCertification:(NSString *)certification {
  self.certificateRating.text = certification;
  
  if ([certification isEqualToString:@"G"]) {
    self.certificateRating.textColor =[UIColor colorWithRed:1.0f/255 green:106.0f/255 blue:49.0f/255 alpha:1];
    self.certificateDescription.text = @"GENERAL\nAUDIENCES";
  } else if ([certification isEqualToString:@"PG"]) {
    self.certificateRating.textColor = [UIColor colorWithRed:242.0f/255 green:90.0f/255 blue:56.0f/255 alpha:1];
    self.certificateDescription.text = @"PARENTAL\nGUIDANCE\nSUGGESTED";
    
  } else if ([certification isEqualToString:@"PG-13"]) {
    self.certificateRating.textColor = [UIColor colorWithRed:118.0f/255 green:64.0f/255 blue:146.0f/255 alpha:1];
    self.certificateDescription.text = @"PARENTS\nSTRONGLY\nCAUTIONED";
  }
  
  [self.certificateRating sizeToFit];
  [self.certificateDescription sizeToFit];
  
  self.certificateRating.center = CGPointMake(80, 22);
  self.certificateDescription.center = CGPointMake(170, 22);
  
  self.certificateDescription.frame = CGRectIntegral(self.certificateDescription.frame);
}

@end