//
//  UIColor+GridsGalleryColor.h
//  GridsGallery
//
//  Created by Daniel Allsop on 04/11/2014.
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

#import "UIColor+GridsGalleryColor.h"

@implementation UIColor (GridsGalleryColor)

+ (UIColor*)gCertificateRatingColor {
  return [UIColor colorWithRed:1.0f/255 green:106.0f/255 blue:49.0f/255 alpha:1];
}

+ (UIColor*)pgCertificateRatingColor {
  return [UIColor colorWithRed:242.0f/255 green:90.0f/255 blue:56.0f/255 alpha:1];
}

+ (UIColor*)pg13CertificateRatingColor {
  return [UIColor colorWithRed:118.0f/255 green:64.0f/255 blue:146.0f/255 alpha:1];
}

+ (UIColor*)startRatingColor {
  return [UIColor colorWithRed:255.0f/255 green:175.0f/255 blue:4.0f/255 alpha:1];
}

+ (UIColor*)emptyStartRatingColor {
  return [UIColor colorWithRed:202.0f/255 green:204.0f/255 blue:204.0f/255 alpha:1];
}

@end

