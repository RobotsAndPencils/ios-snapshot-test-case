//
//  FBSnapshotTestCaseMacTests.m
//  FBSnapshotTestCaseMacTests
//
//  Created by Brandon Evans on 2014-04-28.
//  Copyright (c) 2014 Facebook. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FBSnapshotTestControllerMac.h"

@interface FBSnapshotTestCaseMacTests : XCTestCase

@end

@implementation FBSnapshotTestCaseMacTests

- (NSImage *)bundledImageNamed:(NSString *)name type:(NSString *)type
{
  NSBundle *bundle = [NSBundle bundleForClass:[self class]];
  NSString *path = [bundle pathForResource:name ofType:type];
  NSData *data = [[NSData alloc] initWithContentsOfFile:path];
  return [[NSImage alloc] initWithData:data];
}

- (void)testCompareReferenceImageToImageShouldBeEqual
{
  NSImage *referenceImage = [self bundledImageNamed:@"square" type:@"png"];
  XCTAssertNotNil(referenceImage, @"");
  NSImage *testImage = [self bundledImageNamed:@"square-copy" type:@"png"];
  XCTAssertNotNil(testImage, @"");
  FBSnapshotTestController *controller = [[FBSnapshotTestController alloc] initWithTestClass:nil];
  XCTAssertTrue([controller compareReferenceImage:referenceImage toImage:testImage error:nil], @"");
}

- (void)testCompareReferenceImageToImageShouldNotBeEqual
{
  NSImage *referenceImage = [self bundledImageNamed:@"square" type:@"png"];
  XCTAssertNotNil(referenceImage, @"");
  NSImage *testImage = [self bundledImageNamed:@"square_with_text" type:@"png"];
  XCTAssertNotNil(testImage, @"");
  FBSnapshotTestController *controller = [[FBSnapshotTestController alloc] initWithTestClass:nil];
  XCTAssertFalse([controller compareReferenceImage:referenceImage toImage:testImage error:nil], @"");
}

@end
