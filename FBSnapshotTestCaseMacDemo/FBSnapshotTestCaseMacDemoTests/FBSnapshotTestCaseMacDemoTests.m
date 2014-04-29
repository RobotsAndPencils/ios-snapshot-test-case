//
//  FBSnapshotTestCaseMacDemoTests.m
//  FBSnapshotTestCaseMacDemoTests
//
//  Created by Brandon Evans on 2014-04-16.
//  Copyright (c) 2014 Facebook. All rights reserved.
//

#import "FBSnapshotTestCase.h"
#import "FBMacExampleView.h"

@interface FBSnapshotTestCaseMacDemoTests : FBSnapshotTestCase

@end

@implementation FBSnapshotTestCaseMacDemoTests

- (void)setUp
{
  [super setUp];
  // Flip this to YES to record images in the reference image directory.
  // You need to do this the first time you create a test and whenever you change the snapshotted views.
  // Tests running in record mode will allways fail so that you know that you have to do something here before you commit.
  self.recordMode = NO;
}

- (void)testExample
{
  FBMacExampleView *v = [[FBMacExampleView alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
  FBSnapshotVerifyView(v, nil);
}

@end
