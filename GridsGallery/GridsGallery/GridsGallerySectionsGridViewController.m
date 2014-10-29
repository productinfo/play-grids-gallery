//
//  GridsGallerySectionsGridViewController.m
//  GridsGallery
//
//  Created by Daniel Allsop on 28/10/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "GridsGallerySectionsGridViewController.h"

@implementation GridsGallerySectionsGridViewController

- (void)setupGrid {
  // Group the data by genre
  self.dataSource.groupedPropertyKey = @"genre";
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
    int gross = [[object valueForKey:propertyKey] intValue];
    return [super getGrossStringForValue:gross];
  }
  return nil;
}

@end