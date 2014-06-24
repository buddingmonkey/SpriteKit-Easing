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

@interface SKEase : NSObject

// Generic Types
+(SKAction *)CreatePointTween:(CGVector)start EndPosition:(CGVector)end time:(NSTimeInterval)time easingFunction:(AHEasingFunction)easingFunction setterBlock:(void (^)(SKNode*, CGPoint))setter;
+(SKAction *)CreateFloatTween:(CGFloat)start EndPosition:(CGFloat)end time:(NSTimeInterval)time easingFunction:(AHEasingFunction)easingFunction setterBlock:(void (^)(SKNode*, CGFloat))setter;

// Movement
+(SKAction*) MoveToWithNode:(SKNode*)node EaseFunction:(CurveType)curve Mode:(EasingMode)mode Time:(NSTimeInterval)time ToVector:(CGVector)to;
+(SKAction*) MoveFromWithNode:(SKNode*)target EaseFunction:(CurveType)curve Mode:(EasingMode)mode Time:(NSTimeInterval)time FromVector:(CGVector)from;

// Rotation
+(SKAction*) RotateToWithNode:(SKNode*)target EaseFunction:(CurveType)curve Mode:(EasingMode)mode Time:(NSTimeInterval)time ToValue:(CGFloat)to;
+(SKAction*) RotateFromWithNode:(SKNode*)target EaseFunction:(CurveType)curve Mode:(EasingMode)mode Time:(NSTimeInterval)time FromValue:(CGFloat)from;

// Scale
+(SKAction*) ScaleToWithNode:(SKNode*)target EaseFunction:(CurveType)curve Mode:(EasingMode)mode Time:(NSTimeInterval)time ToValue:(CGFloat)to;
+(SKAction*) ScaleFromWithNode:(SKNode*)target EaseFunction:(CurveType)curve Mode:(EasingMode)mode Time:(NSTimeInterval)time FromValue:(CGFloat)from;

// Fade
+(SKAction*) FadeToWithNode:(SKNode*)target EaseFunction:(CurveType)curve Mode:(EasingMode)mode Time:(NSTimeInterval)time ToValue:(CGFloat)to;
+(SKAction*) FadeFromWithNode:(SKNode*)target EaseFunction:(CurveType)curve Mode:(EasingMode)mode Time:(NSTimeInterval)time FromValue:(CGFloat)from;

@end
