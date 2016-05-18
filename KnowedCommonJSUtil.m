//
//  KnowedCommonJSUtil.m
//  Knowed
//
//  Created by Doug DeJulio on 2016-05-18.
//  Copyright © 2016 Doug DeJulio. All rights reserved.
//

#import "KnowedCommonJSUtil.h"

@implementation KnowedCommonJSUtil

- (KnowedCommonJSUtil *) init
{
    self = [super init];
    knowedName = @"KnowedCommonJSUtil";
    knowedEval = @"require = function(moduleName) { var exports = {}; exports.environment = 'Knowed'; KnowedCommonJSUtil.require(moduleName); return exports;}";
    return self;
}

- (JSValue *) require:(NSString *)moduleName
{
    // Find "moduleName", load it, set up "exports",
    // evaluate the loaded "moduleName", return "exports".
    JSContext *context = [JSContext currentContext];
    
    NSLog(@"Trying to require: %@ via %@", moduleName, context[@"exports"]);
    return nil;
}

@end
