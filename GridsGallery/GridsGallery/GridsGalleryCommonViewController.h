//
//  GridsGalleryCommonViewController.h
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

#import "ShinobiPlayUtils/SPUGalleryManagedViewController.h"
#import <ShinobiGrids/ShinobiGrids.h>

@interface GridsGalleryCommonViewController : SPUGalleryManagedViewController<SDataGridDataSourceHelperDelegate>

@property (weak, nonatomic) IBOutlet ShinobiDataGrid *grid;
@property (strong, nonatomic) SDataGridDataSourceHelper *dataSource;
@property (strong, nonatomic) NSArray *data;

- (void)setupGrid;
- (void)addColumns;

#pragma mark - Utility methods
- (NSString*)getGrossStringForValue:(int)value;
- (void)addColumnWithTitle:(NSString*)title propertyKey:(NSString*)propertyKey
                     width:(float)width textAlignment:(NSTextAlignment)textAlignment
                  cellType:(Class)cellType edgeInsets:(UIEdgeInsets)edgeInsets;

@end
