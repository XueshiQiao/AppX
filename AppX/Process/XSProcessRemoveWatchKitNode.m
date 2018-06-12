//
//  XSProcessRemoveWatchKitNode.m
//  AppX
//
//  Created by Joey on 2018/6/13.
//  Copyright © 2018 NoName. All rights reserved.
//

#import "XSProcessRemoveWatchKitNode.h"

@implementation XSProcessRemoveWatchKitNode

- (void)processWithContext:(XSProcessContext *)context completion:(XSProcessNodeCompletionBlock)completion {
    NSString *appFolder = context.appFolder;
    NSString *watchFolder = [appFolder stringByAppendingPathComponent:@"Watch"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:watchFolder]) {
        NSLog(@"Watch folder exists: %@", watchFolder);
        NSError *error;
        [[NSFileManager defaultManager] removeItemAtPath:watchFolder error:&error];
    }
    
    NSString *plugInFolder = [appFolder stringByAppendingPathComponent:@"PlugIns"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:plugInFolder]) {
        NSLog(@"PlugInfolder exists: %@", plugInFolder);
        NSError *error;
        [[NSFileManager defaultManager] removeItemAtPath:plugInFolder error:&error];
    }

    
    if (completion) {
        completion(self, context, nil);
    }
}

@end
