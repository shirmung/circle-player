//
//  Circle.m
//  CirclePlayer
//
//  Created by Shirmung Bielefeld on 3/17/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>

#import "Circle.h"

@implementation Circle

@synthesize center, radius, diameter;
@synthesize color, pitch;

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
    [self assignProperties];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGRect rectangle = CGRectMake(self.bounds.origin.x + 3.0, self.bounds.origin.y + 3.0, diameter - 6.0, diameter - 6.0);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextStrokePath(context);
    CGContextFillEllipseInRect(context, rectangle);
}

- (void)assignProperties
{
    center = CGPointMake(self.bounds.origin.x + radius, self.bounds.origin.y + radius);
    diameter = radius * 2;

    if (radius >= 3.0 && radius < 100.0) color = [UIColor redColor];
    else if (radius >= 100.0 && radius < 200.0) color = [UIColor orangeColor];
    else if (radius >= 200.0 && radius < 300.0) color = [UIColor yellowColor];
    else if (radius >= 300.0 && radius < 400.0) color = [UIColor greenColor];
    else if (radius >= 400.0 && radius < 500.0) color = [UIColor blueColor];
    else if (radius >= 500.0) color = [UIColor purpleColor];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
	CGPoint currentPoint = [touch locationInView:self];
    
    float distance = sqrt(pow((center.x - currentPoint.x), 2) + pow((center.y - currentPoint.y), 2));

    if (distance <= radius) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"pianoA4" ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:filePath], &soundID);
        AudioServicesPlaySystemSound(soundID);	
    }
}

@end