//
//  No_DTests.m
//  No DTests
//
//  Created by Doug DeJulio on 2014-04-16.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface KnowedBaseTests : XCTestCase {
    JSContext *context;
    JSValue *value;
}

@end

@implementation KnowedBaseTests

- (void)setUp
{
    [super setUp];
    context = [JSContext new];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSimpleArithmetic
{
    NSDictionary *scriptTests = @{
                                  @"1+1": @"2",
                                  @"1*1": @"1",
                                  @"Math.cos(Math.PI)": @"-1"
                                };

    for (NSString *expression in scriptTests) {
        NSString *v = [[context evaluateScript: expression] toString];
        XCTAssertEqualObjects(scriptTests[expression], v,
                       @"expr: %@, expected: %@, got: %@",
                       expression, scriptTests[expression], v);
    }
}

@end
