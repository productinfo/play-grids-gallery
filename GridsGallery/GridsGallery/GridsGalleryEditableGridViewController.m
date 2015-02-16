//
//  GridsGalleryEditableGridViewController.m
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

#import "GridsGalleryEditableGridViewController.h"

@implementation GridsGalleryEditableGridViewController

- (void)setupGrid {
  // Enable editing on all columns
  for (SDataGridColumn *column in self.grid.columns) {
    column.editable = YES;
  }
}

#pragma mark - SDataGridDelegate methods

- (void)shinobiDataGrid:(ShinobiDataGrid *)grid didFinishEditingCellAtCoordinate:(SDataGridCoord *)coordinate {
  SDataGridTextCell *cell = (SDataGridTextCell*)[grid visibleCellAtCoordinate:coordinate];
  // For columns that contain numbers, extract the numbers from the users inputed text,
  // format the result where appropriate, and update the data in the grid.
  if ([coordinate.column.propertyKey isEqualToString:@"gross"]) {
    int value = [self getIntFromString:cell.textField.text];
    cell.textField.text = [super getGrossStringForValue:value];
    self.data[coordinate.row.rowIndex][coordinate.column.propertyKey] = @(value);
  } else if ([coordinate.column.propertyKey isEqualToString:@"year"]) {
    int value = [self getIntFromString:cell.textField.text];
    cell.textField.text = [NSString stringWithFormat:@"%d", value];
    self.data[coordinate.row.rowIndex][coordinate.column.propertyKey] = @(value);
  } else {
    self.data[coordinate.row.rowIndex][coordinate.column.propertyKey] = cell.textField.text;
  }
}

- (int)getIntFromString:(NSString*)string {
  NSArray *numberArray = [string componentsSeparatedByCharactersInSet:
                          [[NSCharacterSet decimalDigitCharacterSet] invertedSet]];
  return [[numberArray componentsJoinedByString:@""] intValue];
}

@end
