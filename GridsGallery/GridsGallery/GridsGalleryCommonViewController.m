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

@interface GridsGalleryCommonViewController ()

@property CGRect gridFrame;
@property CGPoint gridContentOffset;
@property NSArray *selectedRows;
@property NSMutableArray *sectionStatus;
@property NSMutableDictionary *gridColumnSortOrder;
@property NSMutableArray *gridColumnsOrder;

@end

@implementation GridsGalleryCommonViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.gridColumnSortOrder = [NSMutableDictionary new];
  
  [self getData];
  [self addColumns];
  
  [self createDataSource];
  
  [self setupGrid];
  [self styleGrid];
  
  // Update the datasource
  self.dataSource.data = self.data;
  
  self.gridFrame = self.grid.frame;
}

- (void)createDataSource {
  // Create the datasource
  self.dataSource = [[SDataGridDataSourceHelper alloc] initWithDataGrid:self.grid];
  self.dataSource.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  // Recreate the grid if necessary and when the grid does not specifiy a
  // groupedPropertyKey with which to partician the data in the grid into multiple sections.
  // This is to avoid over complicating this simple implementation.
  if ((!self.grid) && (self.dataSource.groupedPropertyKey == nil)) {
    [self createGrid];
    
    // Persist column order
    [self addColumns];
    
    // Persist grid data
    [self createDataSource];
    self.dataSource.data = self.data;
    
    [self setupGrid];
    [self styleGrid];
    
    // Reload grid
    [self.grid reload];
    
    // Set column sort orders
    for (SDataGridColumn *gridColumn in self.grid.columns) {
      SDataGridColumnSortOrder columnSortOrder = (SDataGridColumnSortOrder)[self.gridColumnSortOrder[gridColumn.propertyKey] intValue];
      gridColumn.sortOrder = (columnSortOrder) ? columnSortOrder : SDataGridColumnSortOrderNone;
    }
    
    // Restore selected rows
    [self.grid setSelectedRows:self.selectedRows animated:NO];
  }
  
  // Restore scroll position
  self.grid.contentOffset = self.gridContentOffset;
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  
  // Save the grids state prior to closing the demo when the grid does not specifiy a
  // groupedPropertyKey with which to partician the data in the grid into multiple sections.
  // This is to avoid over complicating this simple implementation.
  if (self.dataSource.groupedPropertyKey == nil) {
      
    // Persist the data
    self.data = [((SDataGridDataSourceHelper*)self.grid.dataSource).sortedData copy];

    // Persist column order
    self.gridColumnsOrder = [NSMutableArray new];
    for (int i = 0; i < [self.grid.columns count]; ++i) {
      [self.gridColumnsOrder addObject:((SDataGridColumn*)self.grid.columns[i]).propertyKey];
    }
    
    // Persist selected rows
    self.selectedRows = self.grid.selectedRows;
    
    // Throw away the grid
    [self.grid removeFromSuperview];
    self.grid = nil;
    self.dataSource.delegate = self;
    self.dataSource = nil;
  }
}

#pragma mark - lifecycle methods that can be implemented in subclasses

- (void)createGrid {
  if (!self.grid) {
    self.grid = [[ShinobiDataGrid alloc] initWithFrame:self.gridFrame];
  }
  
  // Chart may have already been added by a storyboard
  if (![self.grid isDescendantOfView:self.view]) {
    [self.view addSubview:self.grid];
  }
}

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
  if (!self.gridColumnsOrder) {
    self.gridColumnsOrder = [NSMutableArray arrayWithObjects:@"title", @"gross", @"year", @"genre", @"certification", nil];
  }
  
  for (int i = 0; i < self.gridColumnsOrder.count; ++i) {
    NSString *columnPropertyKey = self.gridColumnsOrder[i];
    if ([columnPropertyKey isEqualToString:@"title"]) {
      [self addColumnWithTitle:@"Film Title"
                   propertyKey:@"title"
                         width:285
                 textAlignment:NSTextAlignmentLeft
                      cellType:nil
                    edgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
    } else if (([columnPropertyKey isEqualToString:@"gross"]) || ([columnPropertyKey isEqualToString:@"year"])) {
      [self addColumnWithTitle:[columnPropertyKey capitalizedString]
                   propertyKey:columnPropertyKey
                         width:150
                 textAlignment:NSTextAlignmentRight
                      cellType:nil
                    edgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
    } else {
      [self addColumnWithTitle:[columnPropertyKey capitalizedString]
                   propertyKey:columnPropertyKey
                         width:150
                 textAlignment:NSTextAlignmentLeft
                      cellType:nil
                    edgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
    }
  }
}

- (void)getData {
  NSString *path = [[NSBundle mainBundle] pathForResource:@"GridsGallery-data" ofType:@"plist"];
  
  if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
    self.data = [[NSMutableArray alloc] initWithContentsOfFile:path];
  }
}

#pragma mark - SDataGridDelegate methods

- (void)shinobiDataGrid:(ShinobiDataGrid *)grid didFinishEditingCellAtCoordinate:(SDataGridCoord *)coordinate {
  SDataGridTextCell *cell = (SDataGridTextCell*)[grid visibleCellAtCoordinate:coordinate];
  if ([coordinate.column.propertyKey isEqualToString:@"Gross"]) {
    cell.textField.text = [self formatGrossString:cell.textField.text];
  }
  self.data[coordinate.row.rowIndex][coordinate.column.propertyKey] = cell.textField.text;
  [self.grid reload];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  self.gridContentOffset = scrollView.contentOffset;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
  self.gridContentOffset = scrollView.contentOffset;
}

#pragma mark - Datasource helper methods

- (id)dataGridDataSourceHelper:(SDataGridDataSourceHelper *)helper
       displayValueForProperty:(NSString *)propertyKey withSourceObject:(id)object {
  if ([propertyKey isEqualToString:@"gross"]) {
    return [self formatGrossString:(NSString*)object[propertyKey]];
  }
  return nil;
}

- (void)shinobiDataGrid:(ShinobiDataGrid *)grid didChangeSortOrderForColumn:(SDataGridColumn*) column
                   from:(SDataGridColumnSortOrder) oldSortOrder {
  [self.gridColumnSortOrder setValue:@(column.sortOrder) forKey:column.propertyKey];
}

#pragma mark - Utility methods

- (NSString*)formatGrossString:(NSString*)gross {
  NSArray *array = [gross componentsSeparatedByCharactersInSet:
                    [[NSCharacterSet decimalDigitCharacterSet] invertedSet]];
  int value = [[array componentsJoinedByString:@""] intValue];
  
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
