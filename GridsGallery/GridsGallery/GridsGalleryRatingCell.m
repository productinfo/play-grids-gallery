//
//  GridsGalleryRatingCell.m
//  GridsGallery
//
//  Created by Daniel Allsop on 28/10/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "GridsGalleryRatingCell.h"

@implementation GridsGalleryRatingCell;

- (void)setRating:(int)rating {
  
  UIImage *starImage = [UIImage imageNamed:@"star_hollow.png"];
  CGFloat width = (starImage.size.width * 5);
  CGFloat ratingWidth = (width * ((float)rating / 100));
  
  const CGFloat insetX = 15;
  const CGFloat insetY = 10;
  
  // shows how many star the film has been rated
  [self addRatingViewWithFrame:CGRectMake(insetX, insetY, ratingWidth, starImage.size.height) andBackgroundColor:[UIColor colorWithRed:255.0f/255 green:175.0f/255 blue:4.0f/255 alpha:1]];
  
  // fills the remaing stars in gray
  if(ratingWidth < width){
    [self addRatingViewWithFrame:CGRectMake(ratingWidth + insetX, insetY, (width - ratingWidth), starImage.size.height) andBackgroundColor:[UIColor colorWithRed:202.0f/255 green:204.0f/255 blue:204.0f/255 alpha:1]];
  }
  
  for (int i = 0; i < 5; i++) {
    UIImageView *star = [[UIImageView alloc] init];
    star.image = starImage;
    [star sizeToFit];
    star.frame = CGRectMake(insetX + (i * starImage.size.width), insetY, starImage.size.width, starImage.size.height);
    [self addSubview:star];
  }
}

- (void)resetForReuse {
  [super resetForReuse];
  for (UIView *subview in self.subviews) {
    [subview removeFromSuperview];
  }
}

#pragma mark - Utility methods

- (void)addRatingViewWithFrame:(CGRect)frame andBackgroundColor:(UIColor*)color {
  UIView *ratingView = [UIView new];
  ratingView.backgroundColor = color;
  ratingView.frame = frame;
  [self addSubview:ratingView];
}

@end