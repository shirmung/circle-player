//
//  MainViewController.m
//  CirclePlayer
//
//  Created by Shirmung Bielefeld on 3/17/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "MainViewController.h"
#import "Circle.h"

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
        currentTag = 1;
    }
    
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated 
{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

#pragma mark - Touch

//user touches and drags radius of circle
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];	
    firstPoint = [touch locationInView:self.view];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];	
    lastPoint = [touch locationInView:self.view];
    
    float radius = sqrt(pow((firstPoint.x - lastPoint.x), 2) + pow((firstPoint.y - lastPoint.y), 2));
    
    if (radius >= 3.0) {
        Circle *circle = [[Circle alloc] initWithFrame:CGRectMake(firstPoint.x - radius, firstPoint.y - radius, radius * 2, radius * 2)];
        circle.tag = currentTag;
        circle.radius = radius;
        
        circle.layer.masksToBounds = YES;
        circle.layer.cornerRadius = radius;

        [self.view addSubview:circle];
        
        [circle release];
        
        if (self.view.subviews.count > 20) {
            for (UIView *view in self.view.subviews) {
                if (view.tag == 1) [view removeFromSuperview];
                else view.tag--;
            }
        } 
        
        currentTag++;
    }
}

@end