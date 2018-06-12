//
//  XSProcessBaseNode.m
//  AppX
//
//  Created by Joey on 2018/6/12.
//  Copyright © 2018 NoName. All rights reserved.
//

#import "XSProcessBaseNode.h"

@interface XSProcessBaseNode()

@end

@implementation XSProcessBaseNode

- (void)processWithContext:(XSProcessContext *)context completion:(XSProcessNodeCompletionBlock)completion {
    if (context.stopped == YES) {
        
    }
    
    //do work
    NSLog(@"%@", NSStringFromClass([self class]));
    
    if (completion) {
        completion(self, context, nil);
    }
}

@end
