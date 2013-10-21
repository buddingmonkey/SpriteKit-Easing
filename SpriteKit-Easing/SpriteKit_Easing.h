//
//  SpriteKit_Easing.h
//  SpriteKit-Easing
//
//  Created by Andrew Eiche on 10/20/13.
//  Copyright (c) 2013 Birdcage Games LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "easing.h"
#import "EasingDeclarations.h"

@interface SpriteKit_Easing : NSObject

// Generic Types
+(SKAction *)CreatePointTween:(CGVector)start EndPosition:(CGVector)end time:(NSTimeInterval)time easingFunction:(AHEasingFunction)easingFunction setterBlock:(void (^)(SKNode*, CGPoint))setter;

+(SKAction *)CreateFloatTween:(CGFloat)start EndPosition:(CGFloat)end time:(NSTimeInterval)time easingFunction:(AHEasingFunction)easingFunction setterBlock:(void (^)(SKNode*, CGFloat))setter;

// Movement
+(SKAction*) MoveToWithNode:(SKNode*)node EaseFucntion:(CurveType)curve Mode:(EasingMode)mode Time:(NSTimeInterval)time ToVector:(CGVector)to;
+(SKAction*) MoveFromWithNode:(SKNode*)target EaseFucntion:(CurveType)curve Mode:(EasingMode)mode Time:(NSTimeInterval)time ToVector:(CGVector)from;


@end
