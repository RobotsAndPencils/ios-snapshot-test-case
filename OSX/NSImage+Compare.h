//
//  NSImage+Compare.h
//  FBSnapshotTestCaseDemo
//
//  Created by Brandon Evans on 2014-04-16.
//  Copyright (c) 2014 Facebook. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSImage (Compare)

- (BOOL)compareWithImage:(NSImage *)image;

@end
