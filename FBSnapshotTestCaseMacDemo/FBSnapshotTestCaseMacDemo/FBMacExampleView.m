//
//  FBMacExampleView.m
//  FBSnapshotTestCaseMacDemo
//
//  Created by Brandon Evans on 2014-04-16.
//  Copyright (c) 2014 Facebook. All rights reserved.
//

#import "FBMacExampleView.h"

@implementation FBMacExampleView

- (void)drawRect:(CGRect)rect
{
  [[NSColor redColor] setFill];
  CGContextFillRect([[NSGraphicsContext currentContext] graphicsPort], [self bounds]);
}

@end
