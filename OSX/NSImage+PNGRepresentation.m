//
//  NSImage+PNGRepresentation.m
//  FBSnapshotTestCaseMacDemo
//
//  Created by Brandon Evans on 2014-04-16.
//  Copyright (c) 2014 Facebook. All rights reserved.
//

#import "NSImage+PNGRepresentation.h"

@implementation NSImage (PNGRepresentation)

// Adapted from Marco Tabini's gist https://gist.github.com/mtabini/1178403
- (NSData *)PNGRepresentation {
  [self lockFocus];
  NSBitmapImageRep *bitmapRep = [[NSBitmapImageRep alloc] initWithFocusedViewRect:NSMakeRect(0, 0, self.size.width, self.size.height)];
  [self unlockFocus];

  return [bitmapRep representationUsingType:NSPNGFileType properties:Nil];
}

@end
