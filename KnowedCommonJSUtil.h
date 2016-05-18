//
//  KnowedCommonJSUtil.h
//  Knowed
//
//  Created by Doug DeJulio on 2016-05-18.
//  Copyright © 2016 Doug DeJulio. All rights reserved.
//

#import <Knowed/Knowed.h>

/*!
 This protocol defines the KnowedCommonJSUtil members that should be exposed
 to JavaScript.
 */

@protocol KnowedCommonJSUtil
/*!
 Implement the most basic "require()" functionality needed to load CommonJS modules.
 @param moduleName The name of the module to load.
 @return The object containing the module's exports.
 */
- (JSValue *) require: (NSString *) moduleName;
@end

@interface KnowedCommonJSUtil : KnowedThingy <KnowedCommonJSUtil>
@end
