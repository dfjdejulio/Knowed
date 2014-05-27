//
//  KnowedConsole.h
//  Knowed
//
//  Created by Doug DeJulio on 2014-04-16.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <JavaScriptCore/JavaScriptCore.h>
#import "Knowed/KnowedThingy.h"
#import "Knowed/KnowedTypes.h"

#pragma mark - Protocol

/**
 
 JavaScriptCore can only "see" properties and methods that are defined in a
 protocol that extends the "JSExport" protocol.
 
 */

@protocol KnowedConsoleExports <JSExport>

#pragma mark Exported Methods

/** Implement the console.log() method.
 
 @param message The text to log.
 */

- (void) log: (NSString *) message;


/// Implement the console.clear() method.
- (void) clear;
/** This is the "back-end" implementation of multi-parameter console.log() with
 formatting.  Most JavaScript is not intended to call ths directly.  The
 object's initializaiton script will set up more traditional-looking methods.
 
 @param format The format string.
 @param values The values to be formatted.
 */
- (void) logWithFormat: (NSString *) format andValues: (NSArray *) values;
// TODO: make log varadic (???)
// TOOD: add console.clear()
// TODO: add console.assert()
// TODO: add console.info()
// TODO: add console.error()
// TODO: add console.count()
// TODO: add console.time/timeEnd/timeStamp

@end

#pragma mark - Interface

/**
 
 This class implements some of the behavior required for the JavaScript
 "console" object.

    [myConsoleObject addSelfToContext: myJSContext];
 
 That's how you use it.
 
 */

@interface KnowedConsole : KnowedThingy <KnowedConsoleExports> {
    KnowedOutputBlock outBlock;
}

/// Block to call to send the output.
//@property KnowedOutputBlock outBlock;

#pragma mark Implemented Properties

/** Flag to indicate that .clear() has been called but not yet handled.

 Some implementations of the JavaScript console are handled entirely outside
 of the JavaScript context.  If console.clear() has been called within
 JavaScript but the object couldn't implement that behavior directly, this
 flag will be set, so the environment containing the JavaScript context can
 know the console needs to be cleared.
 */
@property BOOL shouldClear;

#pragma mark Initializers

/// Initialize with an implementation that writes to NSLog().
- (KnowedConsole *) initWithNSLog;
/// Initialize with an implementation that writes to stdout.
- (KnowedConsole *) initWithStdout;
/**
 Initialize with an implementation backed by a code block the user provides.
 As an example, here's the block that "initWithNSLog" uses.
 
    KnowedOutputBlock logWithNSLog =  ^(NSString *message) {
        NSLog(@"JS Log: %@", message);
    };
 
 @param outputBlock The block that implements writing output.
 
 */
- (KnowedConsole *) initWithOutputBlock: (KnowedOutputBlock) outputBlock;

#pragma mark Other Methods
/**
 If the external environment has cleared the console, call this method
 to indicate that.
 */
- (void) didClear;

@end
