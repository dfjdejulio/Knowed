//
//  KnowedCommonJSUtil.h
//  Knowed
//
//  Created by Doug DeJulio on 2016-05-18.
//  Copyright © 2016 Doug DeJulio. All rights reserved.
//

#import <Knowed/Knowed.h>

@protocol KnowedCommonJSUtil
- (JSValue *) require: (NSString *) moduleName;
@end

@interface KnowedCommonJSUtil : KnowedThingy <KnowedCommonJSUtil>
@end
