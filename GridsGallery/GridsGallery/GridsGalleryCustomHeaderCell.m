//
//  GridsGalleryCustomHeaderCell.m
//  GridsGallery
//
//  Created by Daniel Allsop on 13/01/2015.
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

#import "GridsGalleryCustomHeaderCell.h"

@interface GridsGalleryCustomHeaderCell ()

@property UIImageView *arrowView;

@end

@implementation GridsGalleryCustomHeaderCell

- (void)showArrowForSortOrder:(SDataGridColumnSortOrder)sortOrder sortMode:(SDataGridColumnSortMode)sortMode{
 // Remove old arrow.
 [self.arrowView removeFromSuperview];
  
  if((sortMode == SDataGridColumnSortModeBiState) ||  (sortMode == SDataGridColumnSortModeTriState)){
    UIImage *arrow;
    if (sortOrder == SDataGridColumnSortOrderAscending) {
      arrow = [UIImage imageNamed:@"SortUp"];
    } else if (sortOrder == SDataGridColumnSortOrderDescending) {
      arrow = [UIImage imageNamed:@"SortDown"];
    } else {
      arrow = [UIImage imageNamed:@"NoSort"];
    }
    self.arrowView = [[UIImageView alloc] initWithImage:arrow];
    
    // Position and add arrow.
    [self addSubview:self.arrowView];
    self.arrowView.frame = CGRectMake(self.frame.size.width - ((self.textField.text.length == 4) ? 40 : 55) - 21 - 10, 11, 21, 21);
  }
}

@end
