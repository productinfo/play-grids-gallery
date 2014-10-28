//
//  GridsGalleryCommonViewController.m
//  GridsGallery
//
//  Created by Daniel Allsop on 23/10/2014.
//  Copyright (c) 2014 Daniel Allsop. All rights reserved.
//

#import "GridsGalleryCommonViewController.h"

static CGFloat const filmTitleColumnWidth = 350.0f;
static CGFloat const certificationColumnWidth =  170.0f;

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
  
  float columnWidth = ((CGRectGetWidth(self.grid.frame) - (filmTitleColumnWidth + certificationColumnWidth)) / 3);
  
  [self addColumnWithTitle:@"Film Title" propertyKey:@"title" width:filmTitleColumnWidth textAlignment:NSTextAlignmentLeft];
  [self addColumnWithTitle:@"Gross" propertyKey:@"gross" width:columnWidth textAlignment:NSTextAlignmentRight];
  [self addColumnWithTitle:@"Year" propertyKey:@"year" width:columnWidth textAlignment:NSTextAlignmentLeft];
  [self addColumnWithTitle:@"Genre" propertyKey:@"genre" width:columnWidth textAlignment:NSTextAlignmentLeft];
  [self addColumnWithTitle:@"Certification" propertyKey:@"certification" width:certificationColumnWidth textAlignment:NSTextAlignmentLeft];
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
    int gross = [[object valueForKey:propertyKey] intValue];
    return [self getGrossStringForValue:gross];
  }
  return nil;
}

- (NSString*)getGrossStringForValue:(int)value {
  // Convert our int value into a formatted string (e.g 1234 becomes $1,234M)
  NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
  [numberFormatter setPositiveFormat:@"$#,###M"];
  return [numberFormatter stringFromNumber:[NSNumber numberWithInt:value]];
}

#pragma mark - Utility methods

- (void)addColumnWithTitle:(NSString*)title propertyKey:(NSString*)propertyKey width:(float)width textAlignment:(NSTextAlignment)textAlignment{
  SDataGridColumn *column = [[SDataGridColumn alloc] initWithTitle:title];
  column.propertyKey = propertyKey;
  column.width = @(width);
  column.cellStyle.textAlignment = textAlignment;
  [self.grid addColumn:column];
}

@end
