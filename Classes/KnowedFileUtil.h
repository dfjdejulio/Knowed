//
//  KnowedFileUtil.h
//  Knowed
//
//  Created by Doug DeJulio on 5/30/14.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <Knowed/KnowedThingy.h>

/*!
 This protocol defines the KnowedFileUtil members that should be exposed
 to JavaScript.
 */

@protocol KnowedFileUtilExports <JSExport>
/*!
 Import the contents of a URL into a string.
 @param urlstring The URL to fetch things from.
 @return The string with the contents from that URL.
 */
- (NSString *)importUrl: (NSString *)urlstring;
/*!
 Import the contents of a file into a string.
 @param filename The name of the file.
 */
- (NSString *)import: (NSString *)filename;
/*!
 Load and execute the contents of a file, like Rhino's
 builtin "load()" function.
 @param filename The file to load.
 */
- (JSValue *) load: (NSString *) filename;
@end

/*! Provide basic file I/O operations for JavaScriptCore. */
@interface KnowedFileUtil : KnowedThingy <KnowedFileUtilExports>

@end
