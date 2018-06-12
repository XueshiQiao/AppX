//
//  XSProcessContext.h
//  AppX
//
//  Created by Joey on 2018/6/12.
//  Copyright © 2018 NoName. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XSProcessContext : NSObject

@property (nonatomic, copy) NSString *workFolder;
@property (nonatomic, copy) NSString *appFolder;
@property (nonatomic, copy) NSDictionary *infoPlistDict;
@property (nonatomic, copy) NSArray<NSString *> *plugins;
@property (nonatomic, copy) NSArray<NSString *> *frameworks;
@property (nonatomic, copy) NSString *watchFolder;

@property (nonatomic, assign, getter=isStopped) BOOL stopped;

@end
