//
//  GridsGalleryCommonViewController.m
//  GridsGallery
//
//  Created by Daniel Allsop on 23/10/2014.
//  Copyright (c) 2014 Daniel Allsop. All rights reserved.
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
  // Add an implementation in subclasses for any column setup code
}

- (void)getData {
  NSString *path = [[NSBundle mainBundle] pathForResource:@"GridsGallery-data" ofType:@"plist"];
  
  if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
    self.data = [[NSArray alloc] initWithContentsOfFile:path];
  }
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
