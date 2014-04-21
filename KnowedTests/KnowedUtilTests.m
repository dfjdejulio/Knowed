//
//  KnowedUtilBaseTests.m
//  Knowed
//
//  Created by Doug DeJulio on 2014-04-21.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Knowed/Knowed.h>
#import <Foundation/Foundation.h>

#define TESTSTRING @"Hello, sailor!"

@interface KnowedUtilTests : XCTestCase {
    KnowedUtil *util;
    KnowedOutputBlock outBlock;
    KnowedInputBlockWithMessage inBlock;
    JSContext *context;
}

@end

@implementation KnowedUtilTests

- (void)setUp
{
    [super setUp];
    context = [JSContext new];
    util = [KnowedUtil new];
    [util addSelfToContext: context];
    outBlock = ^(NSString *msg) {
        NSLog(@"Util Alert: %@", msg);
    };
    util->outBlock = outBlock;
    inBlock = ^(NSString *msg) {
        NSLog(@"Util Prompt: %@", msg);
        return TESTSTRING;
    };
    util->inBlock = inBlock;
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAlert
{
    [util alert: @"Testing alert..."];
}

- (void)testPrompt
{
    NSString *retval = [util prompt: @"Testing prompt..."];
    XCTAssertEqualObjects(retval, TESTSTRING,
                          "Prompt: expected %@, got %@",
                          retval, TESTSTRING);
}

- (void)testAlertFromJS
{
    [context evaluateScript: @"alert('testing alert from JavaScript')"];
}

- (void)testPromptFromJS
{
    NSString *retval;
    retval = [[context evaluateScript: @"prompt('testing prompt from JavaScript')"] toString];
    XCTAssertEqualObjects(retval, TESTSTRING,
                          @"JS Prompt: expected %@, got %@",
                          retval, TESTSTRING);
    
}

@end
