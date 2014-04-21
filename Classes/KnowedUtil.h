//
//  KnowedUtil.h
//  Knowed
//
//  Created by Doug DeJulio on 2014-04-17.
//  Copyright (c) 2014 Doug DeJulio. All rights reserved.
//

#import <Knowed/Knowed.h>

@protocol KnowedUtilExports <JSExport>

@property (readonly) NSString *eval;
@property (readonly) NSString *name;

- (void) alert: (NSString *) message;

- (NSString *) prompt: (NSString *) message;

@end

@interface KnowedUtil : NSObject <KnowedUtilExports> {
    @public KnowedOutputBlock outBlock;
    @public KnowedInputBlockWithMessage inBlock;
    @protected NSString *eval;
    @protected NSString *name;
}

@end
