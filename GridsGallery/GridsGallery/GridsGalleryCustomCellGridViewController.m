//
//  GridsGalleryCustomCellGridViewController.m
//  GridsGallery
//
//  Created by Daniel Allsop on 28/10/2014.
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

#import "GridsGalleryCustomCellGridViewController.h"
#import "GridsGalleryRatingCell.h"
#import "GridsGalleryCertificationCell.h"

@implementation GridsGalleryCustomCellGridViewController

- (void)setupGrid {

}

- (void)addColumns {
  [super addColumnWithTitle:@"Film Title" propertyKey:@"title" width:285
              textAlignment:NSTextAlignmentLeft cellType:nil edgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
  [super addColumnWithTitle:@"Year" propertyKey:@"year" width:124
              textAlignment:NSTextAlignmentRight cellType:nil edgeInsets:UIEdgeInsetsMake(0, 10, 0, 20)];
  [super addColumnWithTitle:@"Genre" propertyKey:@"genre" width:124
              textAlignment:NSTextAlignmentLeft cellType:nil edgeInsets:UIEdgeInsetsMake(0, 20, 0, 10)];
  [super addColumnWithTitle:@"Rating" propertyKey:@"rating" width:147
              textAlignment:NSTextAlignmentCenter cellType:[GridsGalleryRatingCell class] edgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
  [super addColumnWithTitle:@"Certification" propertyKey:@"certification" width:210
              textAlignment:NSTextAlignmentCenter cellType:[GridsGalleryCertificationCell class] edgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
}

#pragma mark - Datasource helper delegate methods

- (BOOL)dataGridDataSourceHelper:(SDataGridDataSourceHelper *)helper populateCell:(SDataGridCell *)cell withValue:(id)value forProperty:(NSString *)propertyKey sourceObject:(id)object {
  if ([propertyKey isEqualToString:@"rating"]) {
    GridsGalleryRatingCell *ratingCell = (GridsGalleryRatingCell*)cell;
    [ratingCell setRating:[object[@"rating"] intValue]];
    return YES;
  }
  
  if ([propertyKey isEqualToString:@"certification"]) {
    GridsGalleryCertificationCell *certificationCell = (GridsGalleryCertificationCell*)cell;
    [certificationCell setCertification:object[@"certification"]];
    return YES;
  }
  
  return NO;
}

@end