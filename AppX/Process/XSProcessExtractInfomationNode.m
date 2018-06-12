//
//  XSProcessExtractInfomationNode.m
//  AppX
//
//  Created by Joey on 2018/6/13.
//  Copyright © 2018 NoName. All rights reserved.
//

#import "XSProcessExtractInfomationNode.h"

@implementation XSProcessExtractInfomationNode

- (void)processWithContext:(XSProcessContext *)context completion:(XSProcessNodeCompletionBlock)completion {
    NSString *workFolder = context.workFolder;
    if ([[NSFileManager defaultManager] fileExistsAtPath:workFolder]) {
        NSString *appFolder = nil;
        NSArray<NSString *> *subPaths = [[NSFileManager defaultManager] subpathsAtPath:workFolder];
        for (NSString *path in subPaths) {
            if ([path hasSuffix:@".app"]) {
                appFolder = [workFolder stringByAppendingPathComponent:path];
                break;
            }
        }
        context.appFolder = appFolder;
        
        NSString *infoPlistFilePath = [appFolder stringByAppendingPathComponent:@"Info.plist"];
        NSDictionary *infoPlistDict = [NSDictionary dictionaryWithContentsOfFile:infoPlistFilePath];
        context.infoPlistDict = infoPlistDict;
        
        NSLog(@"AppName: %@, bundle ID: %@", infoPlistDict[@"CFBundleDisplayName"], infoPlistDict[@"CFBundleIdentifier"]);
    } else {
        //folder not found
    }
    
    if (completion) {
        completion(self, context, nil);
    }
}

@end
