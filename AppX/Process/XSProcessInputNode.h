//
//  XSProcessInputNode.h
//  AppX
//
//  Created by Joey on 2018/6/13.
//  Copyright © 2018 NoName. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XSProcessBaseNode.h"

@interface XSProcessInputNode : XSProcessBaseNode

- (instancetype)initWithIPAFilePath:(NSString *)IPAFilePath;

@end
