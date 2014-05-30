//
//  KnowedUtil.h
//  Knowed
//
//  Created by Doug DeJulio on 2014-04-17.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <Knowed/KnowedThingy.h>

/**
 
 JavaScriptCore can only "see" properties and methods that are defined in a
 protocol that extends the "JSExport" protocol.
 
 */

@protocol KnowedUtilExports <JSExport>



 
/** Display a JavaScript alert.
 
 @param message The message to display.
 
 */
 - (void) alert: (NSString *) message;


/** Display a modal JavaScript prompt.  Does not work in all environments yet.
 
 @param message The message to display.
 @return The user's entry.
 
 */
- (NSString *) prompt: (NSString *) message;

@end

/**

 This object provides some basic utility functions like "alert()" that are
 normally invoked without regard to the object providing them.  The object's
 JavaScript initialization code must execute in order for this to work, so
 make sure to use this object's addSelfToContext: method instead of trying
 to do it yourself.
 
 */

@interface KnowedUtil : KnowedThingy <KnowedUtilExports> {
    @public KnowedOutputBlock outBlock;
    @public KnowedInputBlockWithMessage inBlock;
}

@end
