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
    CGContextSetFillColorWithColor(context, [self.color CGColor]);
    CGRect rectangle = CGRectMake(self.bounds.origin.x + 3.0, self.bounds.origin.y + 3.0, self.diameter - 6.0, self.diameter - 6.0);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextStrokePath(context);
    CGContextFillEllipseInRect(context, rectangle);
}

- (void)assignProperties
{
    self.center = CGPointMake(self.bounds.origin.x + self.radius, self.bounds.origin.y + self.radius);
    self.diameter = self.radius * 2;

    if (self.radius >= 3.0 && self.radius < 100.0) { 
        self.color = [UIColor redColor];
        self.pitch = @"C4"; // no
    } else if (self.radius >= 100.0 && self.radius < 200.0) {
        self.color = [UIColor orangeColor];
        self.pitch = @"D4";
    } else if (self.radius >= 200.0 && self.radius < 300.0) {
        self.color = [UIColor yellowColor];
        self.pitch = @"E4";
    } else if (self.radius >= 300.0 && self.radius < 400.0) {
        self.color = [UIColor greenColor];
        self.pitch = @"F4";
    } else if (self.radius >= 400.0 && self.radius < 500.0) {
        self.color = [UIColor cyanColor];
        self.pitch = @"G4"; // no
    } else if (self.radius >= 500.0 && self.radius < 600.0) {
        self.color = [UIColor blueColor];
        self.pitch = @"A4";
    } else if (self.radius >= 600.0 && self.radius < 700.0) {
        self.color = [UIColor magentaColor];
        self.pitch = @"B4"; // no
    } else if (self.radius >= 700.0) {
        self.color = [UIColor purpleColor];
        self.pitch = @"C5";
    }
}

#pragma mark - Touch

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
	CGPoint currentPoint = [touch locationInView:self];
    
    float distance = sqrt(pow((self.center.x - currentPoint.x), 2) + pow((self.center.y - currentPoint.y), 2));

    if (distance <= self.radius) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"piano%@", self.pitch] ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:filePath], &soundID);
        AudioServicesPlaySystemSound(soundID);	
    }
}

@end