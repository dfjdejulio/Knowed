//
//  NoDConsoleTests.m
//  No D
//
//  Created by Doug DeJulio on 2014-04-16.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KnowedConsole.h"

@interface KnowedConsoleTests : XCTestCase

@property KnowedConsole *console;

@end

@implementation KnowedConsoleTests
- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testDefaultConfiguratoin
{
    self.console = [KnowedConsole new];
    [self.console log:@"testing default"];
    self.console = nil;
}

- (void)testStdout
{
    self.console = [[KnowedConsole alloc] initWithStdout];
    puts("A testing message should follow this line.");
    [self.console log:@"testing stdout"];
    self.console = nil;
}

- (void)testNSLog
{
    self.console = [[KnowedConsole alloc] initWithNSLog];
    NSLog(@"A testing message should follow this line.");
    [self.console log:@"testing NSLog"];
    self.console = nil;
}

- (void)testBlock
{
    NSString *inMessage = @"Hello, sailor!";
    __block NSMutableString *outMessage = [NSMutableString new];
    NSMutableString *expectedMessage = [NSMutableString new];

    KnowedOutputBlock outBlock = ^(NSString *msg) {
        [outMessage appendFormat: @"%@\n", msg];
    };
    self.console = [[KnowedConsole alloc] initWithOutputBlock: outBlock];
    [self.console log: inMessage];
    [self.console log: inMessage];

    [expectedMessage appendFormat: @"%@\n%@\n", inMessage, inMessage];
    
    XCTAssertEqualObjects(expectedMessage, outMessage,
                          "testing block init, expected %@, got %@",
                          expectedMessage, outMessage);
    self.console = nil;
}

@end
