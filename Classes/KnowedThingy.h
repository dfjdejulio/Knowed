//
//  KnowedThingy.h
//  Knowed
//
//  Created by Doug DeJulio on 2014-04-21.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

/**
 
 This is the base class for all of the "Knowed" objects.
 
 */


@interface KnowedThingy : NSObject {
    @protected NSString *knowedName;
    @protected NSString *knowedEval;
}




#pragma mark Preparing the object for use
/// @name Preparing the object for use

/**
 
 Add the behavior implemented in this object to a provided JavaScriptCore
 JSContext.  The object is bridged into the JSContext, and then initialization
 code is executed in that context.
 
 @param context The JavaScriptCore context.
 @return The result of evaluating this object's JavaScript initialization
 routine.
 
 */

- (JSValue *) addSelfToContext: (JSContext *) context;

#pragma mark Properties
/// @name Properties


/**
 
 The name of the object within the JavaScript context.
 
 */

@property (readonly) NSString *knowedName;


/**
 
 The JavaScript initialization code to be executed upon adding the object,
 if any.
 
 */

@property (readonly) NSString *knowedEval;


@end
