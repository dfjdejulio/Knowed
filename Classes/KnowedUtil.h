//
//  KnowedUtil.h
//  Knowed
//
//  Created by Doug DeJulio on 2014-04-17.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <Knowed/Knowed.h>

@protocol KnowedUtilExports <JSExport>

- (void) alert: (NSString *) message;

- (NSString *) prompt: (NSString *) message;

@end

@interface KnowedUtil : NSObject <KnowedUtilExports> {
    @public KnowedOutputBlock outBlock;
    @public KnowedInputBlockWithMessage inBlock;
}

@end
