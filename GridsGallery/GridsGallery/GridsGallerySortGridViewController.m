//
//  GridsGallerySortGridViewController.m
//  GridsGallery
//
//  Created by Daniel Allsop on 23/10/2014.
//  Copyright (c) 2014 Daniel Allsop. All rights reserved.
//

#import "GridsGallerySortGridViewController.h"
//#import "GridsGallerySortableGridDataSourceHelperDelegate.h"

@implementation GridsGallerySortGridViewController

- (void)setupGrid {
  NSArray *columns = self.grid.columns;
  // Set the second column's sort mode to bi state
  SDataGridColumn *secondColumn = [columns objectAtIndex:1];
  secondColumn.sortMode = SDataGridColumnSortModeBiState;
  // Set the third column's sort mode to tri state
  SDataGridColumn *thirdColumn = [columns objectAtIndex:2];
  thirdColumn.sortMode = SDataGridColumnSortModeTriState;
}

@end
