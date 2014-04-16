//
//  NoDConsole.m
//  No D
//
//  Created by Doug DeJulio on 2014-04-16.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import "NoDConsole.h"

#pragma mark - Library-Supplied Blocks

NoDOutputBlock logWithNSLog =  ^(NSString *message) {
    NSLog(@"JS Log: %@", message);
};

NoDOutputBlock logWithStdout = ^(NSString *message) {
    printf("%s\n", [message UTF8String]);
};

#pragma mark - Implementation

@implementation NoDConsole

#pragma mark Initializers

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
    self.shouldClear = NO;
    return self;
}

#pragma mark Exported Methods

- (void) log: (NSString *) message
{
    self.outBlock(message);
}

- (void) clear
{
    self.shouldClear = YES;
}

- (void) logWithFormat:(NSString *)format andValues:(NSArray *)values
{
    
}

#pragma mark Other Methods
- (void) didClear
{
    self.shouldClear = NO;
}


@end
