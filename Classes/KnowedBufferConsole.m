//
//  NoDBufferConsole.m
//  No D
//
//  Created by Doug DeJulio on 4/16/14.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import "KnowedBufferConsole.h"

#pragma mark - Library-Supplied Blocks


@implementation KnowedBufferConsole

@synthesize contents = contents;

- (KnowedBufferConsole *) init
{
    contents = [NSMutableString new];
    KnowedOutputBlock logWithBuffer = ^(NSString *message) {
        [contents appendFormat: @"%@\n", message];
    };
    return [super initWithOutputBlock: logWithBuffer];

}

- (void) clear
{
    [super clear];
    [contents setString: @""];
    [self didClear];
}

@end
