//
//  NoDConsole.m
//  No D
//
//  Created by Doug DeJulio on 2014-04-16.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import "NoDConsole.h"

NoDOutputBlock logWithNSLog =  ^(NSString *message) {
    NSLog(@"JS Log: %@", message);
};

NoDOutputBlock logWithStdout = ^(NSString *message) {
    printf("%s\n", [message UTF8String]);
};

@implementation NoDConsole

#pragma mark - Initializers

- (NoDConsole *) init
{
    return [self initWithNSLog];
}

- (NoDConsole *) initWithNSLog
{
    return [self initWithOutputBlock: logWithNSLog];
}

- (NoDConsole *) initWithStdout
{
    return [self initWithOutputBlock: logWithStdout];
}

- (NoDConsole *) initWithOutputBlock: (NoDOutputBlock) outputBlock
{
    self = [super init];
    self.outBlock = outputBlock;
    return self;
}

#pragma mark - Working Methods

- (void) log: (NSString *) message {
    self.outBlock(message);
}

@end
