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
  SDataGridColumn *secondColumn = [columns objectAtIndex:1];
  secondColumn.sortMode = SDataGridColumnSortModeBiState;
  // Set the third column's sort mode to tri state
  SDataGridColumn *thirdColumn = [columns objectAtIndex:2];
  thirdColumn.sortMode = SDataGridColumnSortModeTriState;
}

- (void)addColumns {
  [super addColumnWithTitle:@"Film Title" propertyKey:@"title" width:350 textAlignment:NSTextAlignmentLeft titleAlignment:NSTextAlignmentLeft cellType:nil];
  [super addColumnWithTitle:@"Gross" propertyKey:@"gross" width:120 textAlignment:NSTextAlignmentCenter titleAlignment:NSTextAlignmentLeft cellType:nil];
  [super addColumnWithTitle:@"Year" propertyKey:@"year" width:103 textAlignment:NSTextAlignmentCenter titleAlignment:NSTextAlignmentLeft cellType:nil];
  [super addColumnWithTitle:@"Genre" propertyKey:@"genre" width:130 textAlignment:NSTextAlignmentLeft titleAlignment:NSTextAlignmentLeft cellType:nil];
  [super addColumnWithTitle:@"Certification" propertyKey:@"certification" width:220 textAlignment:NSTextAlignmentLeft titleAlignment:NSTextAlignmentLeft cellType:nil];
}

#pragma mark - Datasource helper methods

- (id)dataGridDataSourceHelper:(SDataGridDataSourceHelper *)helper displayValueForProperty:(NSString *)propertyKey withSourceObject:(id)object {
  if ([propertyKey isEqualToString:@"gross"]) {
    // We use this method to convert the gross int value into a string
    int gross = [object[propertyKey] intValue];
    return [super getGrossStringForValue:gross];
  }
  return nil;
}

@end
