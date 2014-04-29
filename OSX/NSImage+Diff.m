//
//  NSImage+Diff.m
//  FBSnapshotTestCaseMacDemo
//
//  Created by Brandon Evans on 2014-04-16.
//  Copyright (c) 2014 Facebook. All rights reserved.
//

#import "NSImage+Diff.h"

@implementation NSImage (Diff)

- (NSImage *)diffWithImage:(NSImage *)image {
  if (!image) {
    return nil;
  }

  CGSize imageSize = CGSizeMake(MAX(self.size.width, image.size.width), MAX(self.size.height, image.size.height));
  NSImage *returnImage = [[NSImage alloc] initWithSize:imageSize];
  [returnImage lockFocus];

  CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
  [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
  CGContextSetAlpha(context, 0.5f);
  CGContextBeginTransparencyLayer(context, NULL);
  [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
  CGContextSetBlendMode(context, kCGBlendModeDifference);
  CGContextSetFillColorWithColor(context, [NSColor whiteColor].CGColor);
  CGContextFillRect(context, CGRectMake(0, 0, self.size.width, self.size.height));
  CGContextEndTransparencyLayer(context);

  [returnImage unlockFocus];
  return returnImage;
}

@end
