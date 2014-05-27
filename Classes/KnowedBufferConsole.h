//
//  NoDBufferConsole.h
//  No D
//
//  Created by Doug DeJulio on 4/16/14.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <Knowed/Knowed.h>

/**

 This provides a console implementation that works entirely by manipulating its
 own internal buffer.  For example, evaluating "console.log()" will append to
 that buffer, and evaluating "console.clear()" will empty it.
 
 You can get the contents of that buffer at any given
 time by fetching the "contents" property.
 
 */

@interface KnowedBufferConsole : KnowedConsole {
    __block NSMutableString *contents;
}

/// @name Working with the console contents

/**

 The current contents of the console.
 
 */

@property NSMutableString *contents;

@end
