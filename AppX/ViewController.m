//
//  ViewController.m
//  AppX
//
//  Created by Joey on 2018/6/12.
//  Copyright © 2018 NoName. All rights reserved.
//

#import "ViewController.h"
#import "GCDTask.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GCDTask* pingTask = [[GCDTask alloc] init];

    [pingTask setLaunchPath:@"/sbin/ping"];
//    [pingTask setArguments:@[@"-c",@"4",@"8.8.8.8"]];

    [pingTask launchWithOutputBlock:^(NSData *stdOutData) {
        NSString* output = [[NSString alloc] initWithData:stdOutData encoding:NSUTF8StringEncoding];
        NSLog(@"OUT: %@", output);
    } andErrorBlock:^(NSData *stdErrData) {
        NSString* output = [[NSString alloc] initWithData:stdErrData encoding:NSUTF8StringEncoding];
        NSLog(@"ERR: %@", output);
    } onLaunch:^{
        NSLog(@"Task has started running.");
    } onExit:^{
        NSLog(@"Task has now quit.");
    }];
    
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
