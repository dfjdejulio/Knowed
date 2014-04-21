//
//  KnowedThingy.h
//  Knowed
//
//  Created by Doug DeJulio on 2014-04-21.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface KnowedThingy : NSObject {
    @protected NSString *knowedName;
    @protected NSString *knowedEval;
}

@property (readonly) NSString *knowedName;
@property (readonly) NSString *knowedEval;

- (JSValue *) addSelfToContext: (JSContext *) context;

@end
