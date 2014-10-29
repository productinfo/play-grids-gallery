//
//  GridsGalleryCertificationCell.h
//  GridsGallery
//
//  Created by Daniel Allsop on 28/10/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import <ShinobiGrids/ShinobiDataGrid.h>

@interface GridsGalleryCertificationCell : SDataGridCell

@property UILabel *certificateRating;
@property UILabel *certificateDescription;

- (void)setCertification:(NSString*)certification;

@end