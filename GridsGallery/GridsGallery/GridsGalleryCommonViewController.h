//
//  GridsGalleryCommonViewController.h
//  GridsGallery
//
//  Created by Daniel Allsop on 23/10/2014.
//  Copyright (c) 2014 Daniel Allsop. All rights reserved.
//

#import "ShinobiPlayUtils/SPUGalleryManagedViewController.h"
#import <ShinobiGrids/ShinobiGrids.h>

@interface GridsGalleryCommonViewController : SPUGalleryManagedViewController< SDataGridDataSourceHelperDelegate> {
  IBOutlet ShinobiDataGrid *grid;
  SDataGridDataSourceHelper *dataSource;
  NSArray *data;
  UITextView *descriptionText;
}

- (void)setupGrid;
- (void)createDataSource;

@end
