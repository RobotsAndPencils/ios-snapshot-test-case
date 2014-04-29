//
//  NSImage+Diff.h
//  FBSnapshotTestCaseMacDemo
//
//  Created by Brandon Evans on 2014-04-16.
//  Copyright (c) 2014 Facebook. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage (Diff)

- (NSImage *)diffWithImage:(NSImage *)image;

@end
