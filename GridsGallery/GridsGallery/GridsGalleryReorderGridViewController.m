//
//  GridsGalleryReorderGridViewController.m
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

#import "GridsGalleryReorderGridViewController.h"

@implementation GridsGalleryReorderGridViewController

- (void)setupGrid {
  // Allow rows to be reordered with a long press
  self.grid.canReorderRows = YES;
  
  // Allow columns to be reordered with a long press
  for (SDataGridColumn *column in self.grid.columns) {
    column.canReorderViaLongPress = YES;
  }
}

@end
