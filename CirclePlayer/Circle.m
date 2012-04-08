//
//  Circle.m
//  CirclePlayer
//
//  Created by Shirmung Bielefeld on 3/17/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "Circle.h"

@implementation Circle

@synthesize center, diameter;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGRect rectangle = CGRectMake(center.x, center.y, diameter, diameter);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextStrokePath(context);
    CGContextFillEllipseInRect(context, rectangle);
}

@end