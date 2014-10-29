//
//  GridsGalleryCustomCellGridViewController.m
//  GridsGallery
//
//  Created by Daniel Allsop on 28/10/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "GridsGalleryCustomCellGridViewController.h"
#import "GridsGalleryRatingCell.h"
#import "GridsGalleryCertificationCell.h"

@implementation GridsGalleryCustomCellGridViewController

- (void)setupGrid {
}

- (void)addColumns {
  [super addColumnWithTitle:@"Film Title" propertyKey:@"title" width:350 textAlignment:NSTextAlignmentLeft titleAlignment:NSTextAlignmentLeft cellType:nil];
  [super addColumnWithTitle:@"Year" propertyKey:@"year" width:90 textAlignment:NSTextAlignmentRight titleAlignment:NSTextAlignmentLeft cellType:nil];
  [super addColumnWithTitle:@"Genre" propertyKey:@"genre" width:120 textAlignment:NSTextAlignmentLeft titleAlignment:NSTextAlignmentLeft cellType:nil];
  [super addColumnWithTitle:@"Rating" propertyKey:@"rating" width:150 textAlignment:NSTextAlignmentRight titleAlignment:NSTextAlignmentCenter cellType:[GridsGalleryRatingCell class]];
  [super addColumnWithTitle:@"Certification" propertyKey:@"certification" width:213 textAlignment:NSTextAlignmentCenter titleAlignment:NSTextAlignmentCenter cellType:[GridsGalleryCertificationCell class]];
}

#pragma mark - Datasource helper delegate methods

- (BOOL)dataGridDataSourceHelper:(SDataGridDataSourceHelper *)helper populateCell:(SDataGridCell *)cell withValue:(id)value forProperty:(NSString *)propertyKey sourceObject:(id)object {
  if ([propertyKey isEqualToString:@"rating"]) {
    GridsGalleryRatingCell *ratingCell = (GridsGalleryRatingCell*)cell;
    [ratingCell setRating:[[object valueForKey:@"rating"] intValue]];
    return YES;
  }
  
  if ([propertyKey isEqualToString:@"certification"]) {
    GridsGalleryCertificationCell *certificationCell = (GridsGalleryCertificationCell*)cell;
    [certificationCell setCertification:[object valueForKey:@"certification"]];
    return YES;
  }
  
  return NO;
}

@end