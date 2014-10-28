//
//  GridsGalleryReorderGridViewController.m
//  GridsGallery
//
//  Created by Daniel Allsop on 23/10/2014.
//  Copyright (c) 2014 Daniel Allsop. All rights reserved.
//

#import "GridsGalleryReorderGridViewController.h"

@implementation GridsGalleryReorderGridViewController

- (void)setupGrid {
  // Allow rows to be reordered with a long press
  self.grid.canReorderRows = YES;
  // Allow columns to be reordered with a long press
  for (SDataGridColumn *column in self.grid.columns) {
    column.canReorderViaLongPress = YES;
  }
}

@end
