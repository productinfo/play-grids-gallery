//
//  GridsGallerySectionsGridViewController.m
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

#import "GridsGallerySectionsGridViewController.h"

@implementation GridsGallerySectionsGridViewController

- (void)setupGrid {
  // Group the data by genre
  self.dataSource.groupedPropertyKey = @"genre";
  
  [super setupGrid];
}

#pragma mark - Datasource helper delegate methods

- (UIView*)shinobiDataGrid:(ShinobiDataGrid *)grid viewForHeaderInSection:(NSInteger)section inFrame:(CGRect)frame{
  UIView *view = [[UIView alloc] initWithFrame:frame];
  view.backgroundColor = grid.defaultSectionHeaderStyle.backgroundColor;
  
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectInset(frame, 10, 0)];
  label.text = [grid.dataSource shinobiDataGrid:grid titleForHeaderInSection:section];
  label.backgroundColor = [UIColor clearColor];
  label.font = [UIFont fontWithName:grid.defaultSectionHeaderStyle.font.fontName size:14];
  [view addSubview:label];
  
  return view;
}

@end