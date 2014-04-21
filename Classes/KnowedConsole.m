//
//  NoDConsole.m
//  No D
//
//  Created by Doug DeJulio on 2014-04-16.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <Knowed/Knowed.h>
#import "KnowedConsole.h"

#pragma mark - Library-Supplied Blocks

KnowedOutputBlock logWithNSLog =  ^(NSString *message) {
    NSLog(@"JS Log: %@", message);
};

KnowedOutputBlock logWithStdout = ^(NSString *message) {
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

- (KnowedConsole *) initWithOutputBlock: (KnowedOutputBlock) outputBlock
{
    self = [super init];
    outBlock = outputBlock;
    self.shouldClear = NO;
    knowedName = @"console";
    knowedEval = @"";
    return self;
}

#pragma mark Exported Methods

- (void) log: (NSString *) message
{
    outBlock(message);
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
