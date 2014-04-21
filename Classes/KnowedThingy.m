//
//  KnowedThingy.m
//  Knowed
//
//  Created by Doug DeJulio on 2014-04-21.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import "KnowedThingy.h"

@implementation KnowedThingy

@synthesize knowedName = knowedName;
@synthesize knowedEval = knowedEval;

- (KnowedThingy *) init
{
    self = [super init];
    knowedName = @"UnInitializedKnowedThingy";
    knowedEval = @"throw 'Uninitialized KnowedThingy';";
    return self;
}

- (JSValue *) addSelfToContext:(JSContext *)context
{
    context[knowedName] = self;
    return [context evaluateScript: knowedEval];
}

@end
