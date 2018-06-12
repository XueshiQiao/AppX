//
//  XSProcessChain.m
//  AppX
//
//  Created by Joey on 2018/6/12.
//  Copyright © 2018 NoName. All rights reserved.
//

#import "XSProcessChain.h"

@interface XSProcessChain()

@property (nonatomic, strong) NSMutableArray<id<XSProcessNode>> *nodes;
@property (nonatomic, strong) XSProcessContext *context;

@end

@implementation XSProcessChain

- (instancetype)init {
    self = [super init];
    if (self) {
        self.nodes = [NSMutableArray arrayWithCapacity:2];
        self.context = [XSProcessContext new];
    }
    return self;
}

- (void)appendNode:(id<XSProcessNode>)node {
    if (node == nil) {
        return;
    }
    
    @synchronized(self.nodes) {
        [self.nodes addObject:node];
    }
}

- (void)removeNode:(id<XSProcessNode>)node {
    if (node == nil) {
        return;
    }
    @synchronized(self.nodes) {
        [self.nodes removeObject:node];
    }
}

- (void)start {
    [self processNode:self.nodes.firstObject withContext:self.context error:nil];
}

- (void)processNode:(id<XSProcessNode>)node withContext:(XSProcessContext *)context error:(NSError *)error {
    if (!error && node != nil) {
        [node processWithContext:context completion:^(id<XSProcessNode> node, XSProcessContext *context, NSError *error) {
            id<XSProcessNode> nextNode = [self nextNodeWithNode:node];
            [self processNode:nextNode withContext:context error:error];
        }];
    }
}

- (id<XSProcessNode>)nextNodeWithNode:(id<XSProcessNode>)node {
    NSInteger index = [self.nodes indexOfObject:node];
    if (index != NSNotFound) {
        if (index < self.nodes.count - 1) {
            return self.nodes[index + 1];
        }
    }
    return nil;
}

- (void)stop {
    self.context.stopped = YES;
}

@end
