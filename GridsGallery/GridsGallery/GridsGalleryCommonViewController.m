//
//  GridsGalleryCommonViewController.m
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

#import "GridsGalleryCommonViewController.h"

@implementation GridsGalleryCommonViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self getData];
  [self addColumns];

  // Create the datasource
  self.dataSource = [[SDataGridDataSourceHelper alloc] initWithDataGrid:self.grid];
  self.dataSource.delegate = self;
  
  [self setupGrid];
  
  // Update the datasource
  self.dataSource.data = self.data;
}

#pragma mark - lifecycle methods that can be implemented in subclasses

- (void)setupGrid {
  // Add an implementation in subclasses for any grid setup code that should be called
  // when a grid is recreated
}

- (void)addColumns {
  [self addColumnWithTitle:@"Film Title" propertyKey:@"title" width:350 textAlignment:NSTextAlignmentLeft titleAlignment:NSTextAlignmentLeft cellType:nil];
  [self addColumnWithTitle:@"Gross" propertyKey:@"gross" width:120 textAlignment:NSTextAlignmentCenter titleAlignment:NSTextAlignmentLeft cellType:nil];
  [self addColumnWithTitle:@"Year" propertyKey:@"year" width:103 textAlignment:NSTextAlignmentCenter titleAlignment:NSTextAlignmentLeft cellType:nil];
  [self addColumnWithTitle:@"Genre" propertyKey:@"genre" width:130 textAlignment:NSTextAlignmentLeft titleAlignment:NSTextAlignmentLeft cellType:nil];
  [self addColumnWithTitle:@"Certification" propertyKey:@"certification" width:220 textAlignment:NSTextAlignmentLeft titleAlignment:NSTextAlignmentLeft cellType:nil];
}

- (void)getData {
  NSString *path = [[NSBundle mainBundle] pathForResource:@"GridsGallery-data" ofType:@"plist"];
  
  if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
    self.data = [[NSArray alloc] initWithContentsOfFile:path];
  }
}

#pragma mark - Datasource helper methods

- (id)dataGridDataSourceHelper:(SDataGridDataSourceHelper *)helper displayValueForProperty:(NSString *)propertyKey withSourceObject:(id)object {
  if ([propertyKey isEqualToString:@"gross"]) {
    // We use this method to convert the gross int value into a string
    int gross = [object[propertyKey] intValue];
    return [self getGrossStringForValue:gross];
  }
  return nil;
}

#pragma mark - Utility methods

- (NSString*)getGrossStringForValue:(int)value {
  // Convert our int value into a formatted string (e.g 1234 becomes $1,234M)
  NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
  [numberFormatter setPositiveFormat:@"$#,###M"];
  return [numberFormatter stringFromNumber:[NSNumber numberWithInt:value]];
}

- (void)addColumnWithTitle:(NSString*)title propertyKey:(NSString*)propertyKey width:(float)width textAlignment:(NSTextAlignment)textAlignment titleAlignment:(NSTextAlignment)titleAlignment cellType:(Class)cellType{
  SDataGridColumn *column = [[SDataGridColumn alloc] initWithTitle:title];
  column.propertyKey = propertyKey;
  column.width = @(width);
  column.cellStyle.textAlignment = textAlignment;
  column.headerCellStyle.textAlignment = titleAlignment;
  if (cellType) {
    column.cellType = cellType;
  }
  [self.grid addColumn:column];
}

@end
