//
//  GridsGalleryCommonViewController.m
//  GridsGallery
//
//  Created by Daniel Allsop on 23/10/2014.
//  Copyright (c) 2014 Daniel Allsop. All rights reserved.
//

#import "GridsGalleryCommonViewController.h"

#define FILM_TITLE_COLUMN_WIDTH 350.0f
#define CERTIFICATION_COLUMN_WIDTH 170.0f

@implementation GridsGalleryCommonViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // Add an implementation in subclasses if the chart isn't created in a xib
  if (!grid) {
    grid = [[ShinobiDataGrid alloc] initWithFrame:CGRectInset(self.view.bounds, 20, 20)];
  }
  
  [self getData];
  [self addColumns];

  [self createDataSource];
  [self setupGrid];
  [self updateDataSource];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - lifecycle methods that can be implemented in subclasses

- (void)setupGrid {
  // Add an implementation in subclasses for any chart setup code that should be called
  // when a chart is recreated
  for (SDataGridColumn *column in grid.columns){
    if([column.title isEqualToString:@"Gross"]) {
      column.cellStyle.textAlignment = NSTextAlignmentRight;
    }
  }
}

- (void)createDataSource {
  // Create the datasource
  dataSource = [[SDataGridDataSourceHelper alloc] initWithDataGrid:grid];
  dataSource.delegate = self;
}

- (void)updateDataSource{
  dataSource.data = data;
  grid.dataSource = dataSource;
}


- (void)addColumns {
  
  float columnWidth = ((CGRectGetWidth(grid.frame) - (FILM_TITLE_COLUMN_WIDTH + CERTIFICATION_COLUMN_WIDTH)) / 3);
  
  [self addColumnWithTitle:@"Film Title" propertyKey:@"title" width:FILM_TITLE_COLUMN_WIDTH];
  [self addColumnWithTitle:@"Gross" propertyKey:@"gross" width:columnWidth];
  [self addColumnWithTitle:@"Year" propertyKey:@"year" width:columnWidth];
  [self addColumnWithTitle:@"Genre" propertyKey:@"genre" width:columnWidth];
  [self addColumnWithTitle:@"Certification" propertyKey:@"certification" width:CERTIFICATION_COLUMN_WIDTH];
}

-(void)getData {
  NSString *path = [[NSBundle mainBundle] pathForResource:@"GridsGallery-data" ofType:@"plist"];
  
  if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
    data = [[NSArray alloc] initWithContentsOfFile:path];
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
  NSMutableString *gross = [NSMutableString stringWithFormat:@"%i",value];
  for (int i = gross.length - 3; i > 0; i = i - 3) {
    [gross insertString:@"," atIndex:i];
  }
  return [NSString stringWithFormat:@"$%@M",gross];
}

#pragma mark - Utility methods

- (void)addColumnWithTitle:(NSString*)title propertyKey:(NSString*)propertyKey width:(float)width {
  SDataGridColumn *column = [[SDataGridColumn alloc] initWithTitle:title];
  column.propertyKey = propertyKey;
  column.width = @(width);
  [grid addColumn:column];
}

@end
