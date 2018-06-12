//
//  XSProcessNode
//  
//
//  Created by Joey on 2018/6/12.
//

#import <Foundation/Foundation.h>
#import "XSProcessContext.h"

@protocol XSProcessNode;

typedef void(^XSProcessNodeCompletionBlock)(id<XSProcessNode> node, XSProcessContext *context, NSError *error);

@protocol XSProcessNode <NSObject>

@required
- (void)processWithContext:(XSProcessContext *)context completion:(XSProcessNodeCompletionBlock)completion;

@end
