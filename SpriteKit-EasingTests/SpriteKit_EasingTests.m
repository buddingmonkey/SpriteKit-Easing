//
//  SpriteKit_EasingTests.m
//  SpriteKit-EasingTests
//
//  Created by Andrew Eiche on 10/20/13.
//  Copyright (c) 2013 Birdcage Games LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SpriteKit/SpriteKit.h>
#import "SKEase.h"

@interface SpriteKit_EasingTests : XCTestCase
    @property (strong, nonatomic) SKView *viewController;
@end

@implementation SpriteKit_EasingTests

- (void)setUp
{
    [super setUp];
    
    self.viewController = [[SKView alloc] init];
    [self.viewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    SKNode * node = [[SKNode alloc]init];
    node.position = CGPointMake(0, 0);
    
    //Add child to scene here
    //[self.viewController addChild:node];
    
    SKAction  *action = [SKEase MoveToWithNode:node EaseFunction:CurveTypeSine Mode:EaseIn Time:.5f ToVector:CGVectorMake(100, 100)];
    [node runAction:action];
    
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
