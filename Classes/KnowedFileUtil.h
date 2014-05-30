//
//  KnowedFileUtil.h
//  Knowed
//
//  Created by Doug DeJulio on 5/30/14.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <Knowed/KnowedThingy.h>

@protocol KnowedFileUtilExports <JSExport>
- (NSString *)importUrl: (NSString *)urlstring;
- (NSString *)import: (NSString *)filename;
- (JSValue *) load: (NSString *) filename;
@end

@interface KnowedFileUtil : KnowedThingy <KnowedFileUtilExports>

@end
