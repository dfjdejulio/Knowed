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

@protocol NoDConsoleExports <JSExport>

@property (nonatomic, readonly) NSString *name;

- (void) log: (NSString *) message;

@end

@interface NoDConsole : NSObject <NoDConsoleExports>

@property (nonatomic, readonly) NSString *name;

@property (copy) NoDOutputBlock outBlock;

- (NoDConsole *) initWithNSLog;
- (NoDConsole *) initWithStdout;
- (NoDConsole *) initWithOutputBlock: (NoDOutputBlock) outputBlock;

@end
