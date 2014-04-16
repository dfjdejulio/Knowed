//
//  NoDConsole.m
//  No D
//
//  Created by Doug DeJulio on 2014-04-16.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import "KnowedConsole.h"

#pragma mark - Library-Supplied Blocks

NoDOutputBlock logWithNSLog =  ^(NSString *message) {
    NSLog(@"JS Log: %@", message);
};

NoDOutputBlock logWithStdout = ^(NSString *message) {
    printf("%s\n", [message UTF8String]);
};

#pragma mark - Implementation

@implementation KnowedConsole

#pragma mark Initializers

- (KnowedConsole *) init
{
    return [self initWithNSLog];
}

- (KnowedConsole *) initWithNSLog
{
    return [self initWithOutputBlock: logWithNSLog];
}

- (KnowedConsole *) initWithStdout
{
    return [self initWithOutputBlock: logWithStdout];
}

- (KnowedConsole *) initWithOutputBlock: (NoDOutputBlock) outputBlock
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
