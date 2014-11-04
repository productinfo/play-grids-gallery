//
//  GridsGallerySortGridViewController.m
//  GridsGallery
//
//  Created by Daniel Allsop on 23/10/2014.
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

#import "GridsGallerySortGridViewController.h"
//#import "GridsGallerySortableGridDataSourceHelperDelegate.h"

@implementation GridsGallerySortGridViewController

- (void)setupGrid {
  NSArray *columns = self.grid.columns;
  
  // Set the second column's sort mode to bi state
  SDataGridColumn *secondColumn = columns[1];
  secondColumn.sortMode = SDataGridColumnSortModeBiState;
  
  // Set the third column's sort mode to tri state
  SDataGridColumn *thirdColumn = columns[2];
  thirdColumn.sortMode = SDataGridColumnSortModeTriState;
}

@end
