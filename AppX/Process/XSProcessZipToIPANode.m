//
//  XSProcessZipToIPANode.m
//  AppX
//
//  Created by Joey on 2018/6/13.
//  Copyright © 2018 NoName. All rights reserved.
//

#import "XSProcessZipToIPANode.h"
#import <SSZipArchive/SSZipArchive.h>

@implementation XSProcessZipToIPANode

- (void)processWithContext:(XSProcessContext *)context completion:(XSProcessNodeCompletionBlock)completion {
    NSString *workFolder = context.workFolder;
    NSString * _Nullable finalIPAFilePath = [workFolder stringByAppendingPathExtension:@"ipa"];
    [SSZipArchive createZipFileAtPath:finalIPAFilePath  withContentsOfDirectory:workFolder];
    if (completion) {
        completion(self, context, nil);
    }
}

@end
