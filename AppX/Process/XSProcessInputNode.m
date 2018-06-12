//
//  XSProcessInputNode.m
//  AppX
//
//  Created by Joey on 2018/6/13.
//  Copyright © 2018 NoName. All rights reserved.
//

#import "XSProcessInputNode.h"
#import "XSProcessBaseNode.h"
#import <SSZipArchive/SSZipArchive.h>

@interface XSProcessInputNode()

@property (nonatomic, strong) NSString *IPAFilePath;

@end

@implementation XSProcessInputNode: XSProcessBaseNode

- (instancetype)initWithIPAFilePath:(NSString *)IPAFilePath {
    self = [super init];
    if (self) {
        _IPAFilePath = IPAFilePath;
    }
    return self;
}

- (void)processWithContext:(XSProcessContext *)context completion:(XSProcessNodeCompletionBlock)completion {
    NSLog(@"%@", NSStringFromClass([self class]));
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:self.IPAFilePath];
    if (fileExists) {
        NSString *unzippedFolderName = [[[self.IPAFilePath lastPathComponent] stringByDeletingPathExtension] stringByAppendingString:@"-modified"];
        NSString *unzippedFolder = [[self.IPAFilePath stringByDeletingLastPathComponent] stringByAppendingPathComponent:unzippedFolderName];
        context.workFolder = unzippedFolder;
        [SSZipArchive unzipFileAtPath:self.IPAFilePath toDestination:unzippedFolder];
    } else {
        
    }
    
    if (completion) {
        completion(self, context, nil);
    }
}

@end
