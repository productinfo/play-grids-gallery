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

@end