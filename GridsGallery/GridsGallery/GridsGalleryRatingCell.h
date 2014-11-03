//
//  GridsGalleryRatingCell.h
//  GridsGallery
//
//  Created by Daniel Allsop on 28/10/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import <ShinobiGrids/ShinobiDataGrid.h>

@interface GridsGalleryRatingCell : SDataGridCell

@property UIView *goldRating;
@property UIView *grayRating;
@property  UIImage *starImage;

- (void)setRating:(int)rating;

@end

