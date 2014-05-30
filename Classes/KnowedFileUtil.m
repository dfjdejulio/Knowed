//
//  KnowedFileUtil.m
//  Knowed
//
//  Created by Doug DeJulio on 5/30/14.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import "KnowedFileUtil.h"

@implementation KnowedFileUtil

- (instancetype)init
{
    self = [super init];
    knowedName = @"KnowedFileUtil";
    knowedEval = @"";
    return self;
}

- (JSValue *) load:(NSString *)filename
{
    NSString *code = [self import:filename];
    return [[JSContext currentContext] evaluateScript:code];
}

- (NSString *) importUrl:(NSString *)urlstring
{
    NSURL *url = [NSURL URLWithString:urlstring];
    return [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:NULL];
}

- (NSString *)import:(NSString *)filename
{
    return [NSString stringWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:NULL];
}

@end
