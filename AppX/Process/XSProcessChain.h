//
//  XSProcessChain.h
//  AppX
//
//  Created by Joey on 2018/6/12.
//  Copyright © 2018 NoName. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XSProcessNode.h"

@interface XSProcessChain : NSObject

- (void)appendNode:(id<XSProcessNode>)node;

- (void)removeNode:(id<XSProcessNode>)node;

- (void)start;

- (void)stop;

@end
