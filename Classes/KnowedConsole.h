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

@protocol KnowedConsoleExports <JSExport>

#pragma mark Exported Attributes

@property BOOL shouldClear;

#pragma mark Exported Methods

- (void) log: (NSString *) message;
- (void) clear;
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

@interface KnowedConsole : KnowedThingy <KnowedConsoleExports> {
    KnowedOutputBlock outBlock;
}

/// Block to call to send the output.
//@property KnowedOutputBlock outBlock;

#pragma mark Implemented Properties

/// Flag to indicate if .clear() has been called but not yet handled.
@property BOOL shouldClear;

#pragma mark Initializers

- (KnowedConsole *) initWithNSLog;
- (KnowedConsole *) initWithStdout;
- (KnowedConsole *) initWithOutputBlock: (KnowedOutputBlock) outputBlock;

#pragma mark Other Methods
- (void) didClear;

@end
