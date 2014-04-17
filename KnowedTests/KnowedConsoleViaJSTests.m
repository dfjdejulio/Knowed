//
//  NoDConsoleViaJSTests.m
//  No D
//
//  Created by Doug DeJulio on 4/16/14.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "KnowedBufferConsole.h"

@interface KnowedConsoleViaJSTests : XCTestCase {
    JSContext *context;
    KnowedBufferConsole *console;
    __block NSMutableString *logBuffer;
}

@end

@implementation KnowedConsoleViaJSTests

- (void)setUp
{
    [super setUp];
    logBuffer = [NSMutableString new];
    context = [JSContext new];
    
    console = [KnowedBufferConsole new];
    context[@"console"] = console;
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testConsoleFromJS
{

    NSArray *testIn = @[
                        @"console.clear()",
                        @"console.log('foo')",
                        @"console.log('bar')",
                        @"console.clear()",
                        @"console.log('baz')"
                        ];
    NSArray *testOut = @[
                         @"",
                         @"foo\n",
                         @"foo\nbar\n",
                         @"",
                         @"baz\n"
                         ];

    XCTAssertEqual(testIn.count, testOut.count,
                   @"Mismatch: %lu != %lu", (unsigned long)testIn.count, (unsigned long)testOut.count);
    for (int i=0; i < testIn.count; i++) {
        [context evaluateScript: testIn[i]];
        XCTAssertEqualObjects(console.contents, testOut[i],
                              @"Console buffer contains unexpected value for %@",
                              testIn[i]);
    }

}

@end
