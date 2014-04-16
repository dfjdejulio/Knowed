//
//  NoDBufferConsole.h
//  No D
//
//  Created by Doug DeJulio on 4/16/14.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import "KnowedConsole.h"

@interface KnowedBufferConsole : KnowedConsole {
    __block NSMutableString *contents;
}

@property NSMutableString *contents;

@end
