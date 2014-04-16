//
//  NoDConsole.h
//  No D
//
//  Created by Doug DeJulio on 2014-04-16.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

typedef void (^NoDOutputBlock)(NSString *message);

#pragma mark - Protocol

@protocol NoDConsoleExports <JSExport>

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

@interface NoDConsole : NSObject <NoDConsoleExports>


@property (copy) NoDOutputBlock outBlock;

#pragma mark Implemented Properties

@property BOOL shouldClear;

#pragma mark Initializers

- (NoDConsole *) initWithNSLog;
- (NoDConsole *) initWithStdout;
- (NoDConsole *) initWithOutputBlock: (NoDOutputBlock) outputBlock;

#pragma mark Other Methods
- (void) didClear;

@end
