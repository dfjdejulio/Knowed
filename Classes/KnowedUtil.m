//
//  KnowedUtil.m
//  Knowed
//
//  Created by Doug DeJulio on 2014-04-17.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <Knowed/Knowed.h>
#import "KnowedUtil.h"

@implementation KnowedUtil

- (void) alert: (NSString *) message
{
    self->outBlock(message);
}

- (NSString *) prompt: (NSString *) message
{
    return self->inBlock(message);
}

@end
