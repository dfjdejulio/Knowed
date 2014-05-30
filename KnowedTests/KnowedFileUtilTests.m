//
//  KnowedFileUtilTests.m
//  Knowed
//
//  Created by Doug DeJulio on 5/30/14.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KnowedFileUtil.h"

@interface KnowedFileUtilTests : XCTestCase

@end

@implementation KnowedFileUtilTests {
    KnowedFileUtil *fileUtil;
}

- (void)setUp
{
    [super setUp];
    if (!fileUtil) {
        fileUtil = [KnowedFileUtil new];
    }
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFileRead
{
    NSArray *files = @[
                      @"/etc/passwd",
                      @"README.md",
                      ];
    for (NSString *file in files) {
        XCTAssertNotNil([fileUtil import:file], "Could not load \"%@\"", file);
    }
}

- (void)testUrlRead
{
    NSArray *urls = @[
                      @"http://www.aisb.org/index.html",
                      @"http://www.aisb.org/",
                      @"http://dfjdejulio.github.io"
                      ];
    for (NSString *url in urls) {
        XCTAssertNotNil([fileUtil importUrl:url], "Could not load \"%@\"", url);
    }
}

- (void)testLoad
{
    JSContext *context = [JSContext new];
    [fileUtil addSelfToContext:context];
    [context evaluateScript:@"load('hello.js')"];
    // Having a dickens of a time figuring out how to test this.
    NSLog(@"load: %@", context[@"load"]);
}

@end
