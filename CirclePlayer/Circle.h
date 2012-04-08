//
//  Circle.h
//  CirclePlayer
//
//  Created by Shirmung Bielefeld on 3/17/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Circle : UIView
{
    CGPoint center;
    float diameter;
}

@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) float diameter;

@end