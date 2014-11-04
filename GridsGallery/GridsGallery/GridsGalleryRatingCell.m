//
//  GridsGalleryRatingCell.m
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

#import "GridsGalleryRatingCell.h"
#import "UIColor+GridsGalleryColor.h"

@interface GridsGalleryRatingCell ()

@property UIView *starRating;
@property UIView *emptyRating;
@property UIImage *starImage;

@end

@implementation GridsGalleryRatingCell

const CGFloat insetX = 10;
const CGFloat insetY = 10;

-(id)initWithReuseIdentifier:(NSString *)identifier {
  if (self = [super initWithReuseIdentifier:identifier]) {
    self.starRating = [self initializeRatingView:self.starRating
                             withBackgroundColor:[UIColor startRatingColor]];
    
    self.emptyRating = [self initializeRatingView:self.emptyRating
                             withBackgroundColor:[UIColor emptyStartRatingColor]];
    
    self.starImage = [UIImage imageNamed:@"star_hollow.png"];
    for (int i = 0; i < 5; i++) {
      UIImageView *star = [[UIImageView alloc] init];
      star.image = self.starImage;
      [star sizeToFit];
      star.frame = CGRectMake(insetX + (i * self.starImage.size.width), insetY, self.starImage.size.width, self.starImage.size.height);
      [self addSubview:star];
    }
  }
  return self;
}

- (void)setRating:(int)rating {  
  CGFloat width = (self.starImage.size.width * 5);
  CGFloat ratingWidth = (width * ((float)rating / 100));
  
  // shows how many star the film has been rated
  self.starRating.frame = CGRectMake(insetX, insetY, ratingWidth, self.starImage.size.height);
  
  // fills the remaing stars in gray
  self.emptyRating.frame = CGRectMake(ratingWidth + insetX, insetY, (width - ratingWidth), self.starImage.size.height);
}

#pragma mark - Utility methods

- (UIView*)initializeRatingView:(UIView*)uiView withBackgroundColor:(UIColor*)color {
  uiView = [UIView new];
  uiView.backgroundColor = color;
  [self addSubview:uiView];
  return uiView;
}

@end