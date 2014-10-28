//
//  GridsGalleryEditableGridViewController.m
//  GridsGallery
//
//  Created by Daniel Allsop on 23/10/2014.
//  Copyright (c) 2014 Daniel Allsop. All rights reserved.
//

#import "GridsGalleryEditableGridViewController.h"
//#import "GridsGalleryEditableGridDataSourceHelperDelegate.h"

@implementation GridsGalleryEditableGridViewController

- (void)setupGrid {
  // Enable editing on all columns
  for (SDataGridColumn *column in self.grid.columns) {
    column.editable = YES;
  }
}

@end
