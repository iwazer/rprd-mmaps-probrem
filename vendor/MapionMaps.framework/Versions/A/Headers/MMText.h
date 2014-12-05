//
//  MMText.h
//  MapionMaps
//
//  Created by honjo on 2014/04/03.
//  Copyright (c) 2014 Mapion Co.,Ltd. All rights reserved.
//

#import <MapionMaps/MapionMaps.h> 

@interface MMText : MMOverlay

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSString *textString;
@property (nonatomic, assign) CGFloat textFontSize;
@property (nonatomic, assign) CFTypeRef textFont;
@property (nonatomic, assign) CGColorRef textForegroundColor;
@property (nonatomic, assign) CGColorRef textBackgroundColor;

- (id)initWithMapView:(MMMapView *)mapView coordinate:(CLLocationCoordinate2D)coordinate textString:(NSString *)textString;

@end
