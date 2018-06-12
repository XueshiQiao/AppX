//
//  AppXTests.m
//  AppXTests
//
//  Created by Joey on 2018/6/12.
//  Copyright © 2018 NoName. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XSProcessChain.h"
#import "XSProcessBaseNode.h"
#import "XSProcessInputNode.h"
#import "XSProcessExtractInfomationNode.h"
#import "XSProcessRemoveWatchKitNode.h"
#import "XSProcessSignNode.h"
#import "XSProcessZipToIPANode.h"

@interface AppXTests : XCTestCase

@property (nonatomic, strong) XSProcessChain *processChain;
@property (nonatomic, strong) XSProcessContext *processContext;

@end

@implementation AppXTests

- (void)setUp {
    [super setUp];
    self.processContext = [XSProcessContext new];
    self.processChain = [[XSProcessChain alloc] init];
    [self.processChain appendNode:[[XSProcessInputNode alloc] initWithIPAFilePath:@"/Users/qiaoxueshi/Library/Containers/com.joeyio.AppX/Data/陌陌.ipa"]];
    [self.processChain appendNode:[[XSProcessExtractInfomationNode alloc] init]];
    [self.processChain appendNode:[XSProcessRemoveWatchKitNode new]];
    [self.processChain appendNode:[XSProcessSignNode new]];
    [self.processChain appendNode:[XSProcessZipToIPANode new]];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testProcess {
    [self.processChain start];
    
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
