//
//  TapViewController.m
//  MoreGesturesPractice
//
//  Created by Angie Linton on 2017-01-19.
//  Copyright © 2017 Angie Linton. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

-(void) handleSingleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer;
-(void)handleDoubleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer;

//the gesture recognizer method passes itself to the selector method.. by using this method signature we can use it later in the implementation.
@end

@implementation TapViewController
-(void) handleSingleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer{
    
    //first we check if the initial width of the view is 100, and if so we make it 200, otherwise we keep the original assigned value
    
    CGFloat newWidth = 100.0;
    if (self.testView.frame.size.width == 100.0) {
        newWidth = 200.0;
    }
    
    //We keep to a CGPoint structure variable, the current centre point,
    CGPoint currentCenter = self.testView.center;
    
    //we change the width of the view and then we centre it again
    self.testView.frame = CGRectMake(self.testView.frame.origin.x,  self.testView.frame.origin.y, newWidth, self.testView.frame.size.height);
    self.testView.center = currentCenter;
}
-(void)handleDoubleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer{
    CGSize newSize = CGSizeMake(100.0, 100.0);
    if (self.testView.frame.size.width == 100.0) {
        newSize.width = 200.0;
        newSize.height = 200.0;
    }
    
    CGPoint currentCenter = self.testView.center;
    
    self.testView.frame = CGRectMake(self.testView.frame.origin.x, self.testView.frame.origin.y, newSize.width, newSize.height);
    self.testView.center = currentCenter;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
   UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapGesture:)];
[self.testView addGestureRecognizer:singleTapGestureRecognizer];

    
    UITapGestureRecognizer *doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTapGesture:)];
    doubleTapGestureRecognizer.numberOfTapsRequired = 2;
    doubleTapGestureRecognizer.numberOfTouchesRequired = 2;
    [self.testView addGestureRecognizer:doubleTapGestureRecognizer];
}



@end
