//
//  NSImage+Compare.m
//  FBSnapshotTestCaseDemo
//
//  Created by Brandon Evans on 2014-04-16.
//  Copyright (c) 2014 Facebook. All rights reserved.
//

#import "NSImage+Compare.h"

@implementation NSImage (Compare)

- (BOOL)compareWithImage:(NSImage *)image {
  NSAssert(CGSizeEqualToSize(self.size, image.size), @"Images must be same size.");

  // The images have the equal size, so we could use the smallest amount of bytes because of byte padding
  CGImageRef selfCGImageRef = [self CGImageForProposedRect:NULL context:[NSGraphicsContext currentContext] hints:nil];
  CGImageRef imageCGImageRef = [image CGImageForProposedRect:NULL context:[NSGraphicsContext currentContext] hints:nil];
  size_t minBytesPerRow = MIN(CGImageGetBytesPerRow(selfCGImageRef), CGImageGetBytesPerRow(imageCGImageRef));
  size_t referenceImageSizeBytes = CGImageGetHeight(selfCGImageRef) * minBytesPerRow;
  void *referenceImagePixels = calloc(1, referenceImageSizeBytes);
  void *imagePixels = calloc(1, referenceImageSizeBytes);

  if (!referenceImagePixels || !imagePixels) {
    free(referenceImagePixels);
    free(imagePixels);
    return NO;
  }

  CGContextRef referenceImageContext = CGBitmapContextCreate(referenceImagePixels,
                                                             CGImageGetWidth(selfCGImageRef),
                                                             CGImageGetHeight(selfCGImageRef),
                                                             CGImageGetBitsPerComponent(selfCGImageRef),
                                                             minBytesPerRow,
                                                             CGColorSpaceCreateDeviceRGB(),
                                                             (CGBitmapInfo)kCGImageAlphaPremultipliedLast
                                                             );
  CGContextRef imageContext = CGBitmapContextCreate(imagePixels,
                                                    CGImageGetWidth(imageCGImageRef),
                                                    CGImageGetHeight(imageCGImageRef),
                                                    CGImageGetBitsPerComponent(imageCGImageRef),
                                                    minBytesPerRow,
                                                    CGColorSpaceCreateDeviceRGB(),
                                                    (CGBitmapInfo)kCGImageAlphaPremultipliedLast
                                                    );

  if (!referenceImageContext || !imageContext) {
    CGContextRelease(referenceImageContext);
    CGContextRelease(imageContext);
    free(referenceImagePixels);
    free(imagePixels);
    return NO;
  }

  CGContextDrawImage(referenceImageContext, CGRectMake(0.0f, 0.0f, self.size.width, self.size.height), selfCGImageRef);
  CGContextDrawImage(imageContext, CGRectMake(0.0f, 0.0f, image.size.width, image.size.height), imageCGImageRef);
  CGContextRelease(referenceImageContext);
  CGContextRelease(imageContext);

  BOOL imageEqual = (memcmp(referenceImagePixels, imagePixels, referenceImageSizeBytes) == 0);
  free(referenceImagePixels);
  free(imagePixels);
  return imageEqual;
}

@end
