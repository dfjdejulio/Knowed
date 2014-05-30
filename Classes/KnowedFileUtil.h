//
//  KnowedFileUtil.h
//  Knowed
//
//  Created by Doug DeJulio on 5/30/14.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <Knowed/Knowed.h>

@protocol KnowedFileUtilExports <JSExport>
- (JSValue *)load: (NSString *)filename;
@end

@interface KnowedFileUtil : KnowedThingy <KnowedFileUtilExports>

@end
