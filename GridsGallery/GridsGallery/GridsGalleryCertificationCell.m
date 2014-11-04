//
//  GridsGalleryCertificationCell.m
//  GridsGallery
//
//  Created by Daniel Allsop on 28/10/2014.
//
//  Copyright 2014 Scott Logic
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
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