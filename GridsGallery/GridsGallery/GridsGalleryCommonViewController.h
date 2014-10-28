//
//  GridsGalleryCommonViewController.h
//  GridsGallery
//
//  Created by Daniel Allsop on 23/10/2014.
//  Copyright (c) 2014 Daniel Allsop. All rights reserved.
//

#import "ShinobiPlayUtils/SPUGalleryManagedViewController.h"
#import <ShinobiGrids/ShinobiGrids.h>

@interface GridsGalleryCommonViewController : SPUGalleryManagedViewController<SDataGridDataSourceHelperDelegate>

@property (weak, nonatomic) IBOutlet ShinobiDataGrid *grid;
@property (strong, atomic) SDataGridDataSourceHelper *dataSource;
@property (strong, atomic) NSArray *data;
@property (strong, atomic) UITextView *descriptionText;

- (void)setupGrid;

@end
