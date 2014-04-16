//
//  NoDBufferConsoleTests.m
//  No D
//
//  Created by Doug DeJulio on 4/16/14.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KnowedBufferConsole.h"

@interface KnowedBufferConsoleTests : XCTestCase

@property KnowedBufferConsole *console;

@end

@implementation KnowedBufferConsoleTests

- (void)setUp
{
    [super setUp];
    self.console = [KnowedBufferConsole new];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testWritingToBuffer
{
    [self.console clear];
    XCTAssertEqualObjects(self.console.contents, @"",
                          "Buffer not empty, contians: %@",
                          self.console.contents);
    [self.console log: @"One"];
    [self.console log: @"Two"];
    [self.console log: @"Three"];
    XCTAssertEqualObjects(self.console.contents, @"One\nTwo\nThree\n",
                          @"Buffer does not contain expected values.");
}

- (void) testClearingBuffer
{
    [self.console log: @"Junk"];
    XCTAssertNotEqualObjects(self.console.contents, @"",
                             @"Buffer was unexpectedly empty.");
    [self.console clear];
    XCTAssertEqualObjects(self.console.contents, @"",
                          @"Buffer was unexpectedly not empty.");
}

@end
