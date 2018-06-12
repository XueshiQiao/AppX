//
//  XSProcessSignNode.m
//  AppX
//
//  Created by Joey on 2018/6/13.
//  Copyright © 2018 NoName. All rights reserved.
//

#import "XSProcessSignNode.h"

@implementation XSProcessSignNode

- (void)processWithContext:(XSProcessContext *)context completion:(XSProcessNodeCompletionBlock)completion {
    if (completion) {
        completion(self, context, nil);
    }
}

@end
