//
//  Circle.m
//  CirclePlayer
//
//  Created by Shirmung Bielefeld on 3/17/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "Circle.h"

@implementation Circle

@synthesize center, radius, diameter;
@synthesize color;

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
    [self assignDiameter];
    [self assignColor];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGRect rectangle = CGRectMake(center.x, center.y, diameter, diameter);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextStrokePath(context);
    CGContextFillEllipseInRect(context, rectangle);
}

- (void)assignDiameter
{
    diameter = radius * 2;
}

- (void)assignColor
{
    NSLog(@"%f", radius);
    
    if (radius >= 3.0 && radius < 100.0) color = [UIColor redColor];
    else if (radius >= 100.0 && radius < 200.0) color = [UIColor orangeColor];
    else if (radius >= 200.0 && radius < 300.0) color = [UIColor yellowColor];
    else if (radius >= 300.0 && radius < 400.0) color = [UIColor greenColor];
    else if (radius >= 400.0 && radius < 500.0) color = [UIColor blueColor];
    else if (radius >= 500.0) color = [UIColor purpleColor];
}

@end