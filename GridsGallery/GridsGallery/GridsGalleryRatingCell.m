//
//  GridsGalleryRatingCell.m
//  GridsGallery
//
//  Created by Daniel Allsop on 28/10/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "GridsGalleryRatingCell.h"

@interface GridsGalleryRatingCell ()

@property UIView *goldRating;
@property UIView *grayRating;
@property  UIImage *starImage;

@end

@implementation GridsGalleryRatingCell

const CGFloat insetX = 15;
const CGFloat insetY = 10;

-(id)initWithReuseIdentifier:(NSString *)identifier {
  if (self = [super initWithReuseIdentifier:identifier]) {
    self.goldRating = [self initializeRatingView:self.goldRating withBackgroundColor:[UIColor colorWithRed:255.0f/255 green:175.0f/255 blue:4.0f/255 alpha:1]];
    
    self.grayRating = [self initializeRatingView:self.grayRating withBackgroundColor:[UIColor colorWithRed:202.0f/255 green:204.0f/255 blue:204.0f/255 alpha:1]];
    
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
  self.goldRating.frame = CGRectMake(insetX, insetY, ratingWidth, self.starImage.size.height);
  
  // fills the remaing stars in gray
  self.grayRating.frame = CGRectMake(ratingWidth + insetX, insetY, (width - ratingWidth), self.starImage.size.height);
}

#pragma mark - Utility methods

- (UIView*)initializeRatingView:(UIView*)uiView withBackgroundColor:(UIColor*)color {
  uiView = [UIView new];
  uiView.backgroundColor = color;
  [self addSubview:uiView];
  return uiView;
}

@end