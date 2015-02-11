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
#import "ShinobiPlayUtils/UIFont+SPUFont.h"
#import "ShinobiPlayUtils/UIColor+SPUColor.h"
#import "GridsGalleryCustomHeaderCell.h"

@implementation GridsGalleryCommonViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self getData];
  [self addColumns];

  // Create the datasource
  self.dataSource = [[SDataGridDataSourceHelper alloc] initWithDataGrid:self.grid];
  self.dataSource.delegate = self;
  
  [self setupGrid];
  [self styleGrid];
  
  // Update the datasource
  self.dataSource.data = self.data;
}

#pragma mark - lifecycle methods that can be implemented in subclasses

- (void)setupGrid {
  // Add an implementation in subclasses for any grid setup code that should be called
  // when a grid is recreated
}

- (void)styleGrid {
  // Get the theme to set the basic fonts and colours
  
  SDataGridTheme *theme = [SDataGridiOS7Theme new];
  
  SDataGridCellStyle *headerRowStyle = [self createDataGridCellStyleWithFont:[UIFont boldShinobiFontOfSize:20]
                                                                   textColor:[UIColor whiteColor]
                                                            backgroundColour:[[UIColor shinobiPlayBlueColor] shinobiLightColor]];
  headerRowStyle.contentInset = UIEdgeInsetsMake(0, 10, 0, 10);
  theme.headerRowStyle = headerRowStyle;
  
  SDataGridCellStyle *selectedCellStyle = [self createDataGridCellStyleWithFont:[UIFont shinobiFontOfSize:13]
                                                                      textColor:[UIColor whiteColor]
                                                               backgroundColour:[UIColor shinobiPlayBlueColor]];
  theme.selectedCellStyle = selectedCellStyle;
  
  SDataGridCellStyle *rowStyle = [self createDataGridCellStyleWithFont:[UIFont shinobiFontOfSize:13]
                                                             textColor:[UIColor shinobiDarkGrayColor]
                                                      backgroundColour:[UIColor whiteColor]];
  theme.rowStyle = rowStyle;
  theme.alternateRowStyle = rowStyle;

  SDataGridLineStyle *gridLineStyle = [SDataGridLineStyle new];
  gridLineStyle.width = 0.5;
  gridLineStyle.color = [UIColor lightGrayColor];
  theme.gridLineStyle = gridLineStyle;
  
  SDataGridSectionHeaderStyle *dataGridSectionHeaderStyle = [SDataGridSectionHeaderStyle new];
  dataGridSectionHeaderStyle.backgroundColor = [[UIColor shinobiPlayBlueColor] shinobiBackgroundColor];
  dataGridSectionHeaderStyle.font = [UIFont boldShinobiFontOfSize:14];
  dataGridSectionHeaderStyle.textColor = [UIColor shinobiDarkGrayColor];
  theme.sectionHeaderStyle = dataGridSectionHeaderStyle;
  
  [self.grid applyTheme:theme];
}

- (SDataGridCellStyle*)createDataGridCellStyleWithFont:(UIFont*)font
                                             textColor:(UIColor*)textColor
                                      backgroundColour:(UIColor*)backgroundColor {
  SDataGridCellStyle *dataGridCellStyle = [SDataGridCellStyle new];
  dataGridCellStyle.textVerticalAlignment = UIControlContentVerticalAlignmentCenter;
  dataGridCellStyle.font = font;
  dataGridCellStyle.textColor = textColor;
  dataGridCellStyle.backgroundColor = backgroundColor;
  return dataGridCellStyle;
}

- (void)addColumns {
  [self addColumnWithTitle:@"Film Title" propertyKey:@"title" width:285
             textAlignment:NSTextAlignmentLeft cellType:nil edgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
  [self addColumnWithTitle:@"Gross" propertyKey:@"gross" width:151
             textAlignment:NSTextAlignmentRight cellType:nil edgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
  [self addColumnWithTitle:@"Year" propertyKey:@"year" width:151
             textAlignment:NSTextAlignmentRight cellType:nil edgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
  [self addColumnWithTitle:@"Genre" propertyKey:@"genre" width:151
             textAlignment:NSTextAlignmentLeft cellType:nil edgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
  [self addColumnWithTitle:@"Certification" propertyKey:@"certification" width:151
             textAlignment:NSTextAlignmentLeft cellType:nil edgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
}

- (void)getData {
  NSString *path = [[NSBundle mainBundle] pathForResource:@"GridsGallery-data" ofType:@"plist"];
  
  if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
    self.data = [[NSArray alloc] initWithContentsOfFile:path];
  }
}

#pragma mark - Datasource helper methods

- (id)dataGridDataSourceHelper:(SDataGridDataSourceHelper *)helper
       displayValueForProperty:(NSString *)propertyKey withSourceObject:(id)object {
  if ([propertyKey isEqualToString:@"gross"]) {
    // We use this method to convert the gross int value into a string
    int gross = [object[propertyKey] intValue];
    return [self getGrossStringForValue:gross];
  }
  return nil;
}

#pragma mark - Utility methods

- (NSString*)getGrossStringForValue:(int)value {
  static NSNumberFormatter *numberFormatter = nil;
  
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    // Convert our int value into a formatted string (e.g 1234 becomes $1,234M)
    [numberFormatter setPositiveFormat:@"$#,###M"];
  });
  
  return [numberFormatter stringFromNumber:[NSNumber numberWithInt:value]];
}

- (void)addColumnWithTitle:(NSString*)title propertyKey:(NSString*)propertyKey
                     width:(float)width textAlignment:(NSTextAlignment)textAlignment
                  cellType:(Class)cellType edgeInsets:(UIEdgeInsets)edgeInsets{
  SDataGridColumn *column = [[SDataGridColumn alloc] initWithTitle:title];
  column.propertyKey = propertyKey;
  column.width = @(width);
  column.cellStyle.textAlignment = textAlignment;
  column.cellStyle.contentInset = edgeInsets;
  column.headerCellStyle.contentInset = edgeInsets;
  column.headerCellStyle.textAlignment = textAlignment;
  column.headerCellType = [GridsGalleryCustomHeaderCell class];
  if (cellType) {
    column.cellType = cellType;
  }
  [self.grid addColumn:column];
}

@end
