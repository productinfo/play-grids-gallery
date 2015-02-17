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
  // For columns that contain numbers, extract the numbers from the user input,
  // format the result where appropriate, and update the data in the grid.
  if ([coordinate.column.propertyKey isEqualToString:@"gross"]) {
    NSInteger value = [self getIntegerFromString:cell.textField.text];
    cell.textField.text = [super getGrossStringForValue:value];
    self.data[coordinate.row.rowIndex][coordinate.column.propertyKey] = @(value);
  } else if ([coordinate.column.propertyKey isEqualToString:@"year"]) {
    NSInteger value = [self getIntegerFromString:cell.textField.text];
    cell.textField.text = [NSString stringWithFormat:@"%d", value];
    self.data[coordinate.row.rowIndex][coordinate.column.propertyKey] = @(value);
  } else {
    self.data[coordinate.row.rowIndex][coordinate.column.propertyKey] = cell.textField.text;
  }
}

- (NSInteger)getIntegerFromString:(NSString*)string {
  NSError *error = nil;
  // Create regex that looks for all non digit or a decimal point in the string
  NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\d\\.]"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:&error];
  // Replace all the characters found by our regex leaving just the digits
  NSString *numberString = [regex stringByReplacingMatchesInString:string
                                                           options:0
                                                             range:NSMakeRange(0, [string length])
                                                      withTemplate:@""];
  return [numberString integerValue];
}

@end
