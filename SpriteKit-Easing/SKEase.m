//
//  SpriteKit_Easing.m
//  SpriteKit-Easing
//
//  Created by Andrew Eiche on 10/20/13.
//  Copyright (c) 2013 Birdcage Games LLC. All rights reserved.
//

#import "SKEase.h"

@implementation SKEase

+(AHEasingFunction) GetEaseFunction:(CurveType) curve Mode:(EasingMode) mode{
    AHEasingFunction currentFunction;
    switch(curve)
    {
        case CurveTypeLinear:
            currentFunction = LinearInterpolation;
            break;
        case CurveTypeQuadratic:
            currentFunction = (mode == EaseIn) ? QuadraticEaseIn : (mode == EaseOut) ? QuadraticEaseOut : QuadraticEaseInOut;
            break;
        case CurveTypeCubic:
            currentFunction = (mode == EaseIn) ? CubicEaseIn : (mode == EaseOut) ? CubicEaseOut : CubicEaseInOut;
            break;
        case CurveTypeQuartic:
            currentFunction = (mode == EaseIn) ? QuarticEaseIn : (mode == EaseOut) ? QuarticEaseOut : QuarticEaseInOut;
            break;
        case CurveTypeQuintic:
            currentFunction = (mode == EaseIn) ? QuinticEaseIn : (mode == EaseOut) ? QuinticEaseOut : QuinticEaseInOut;
            break;
        case CurveTypeSine:
            currentFunction = (mode == EaseIn) ? SineEaseIn : (mode == EaseOut) ? SineEaseOut : SineEaseInOut;
            break;
        case CurveTypeCircular:
            currentFunction = (mode == EaseIn) ? CircularEaseIn : (mode == EaseOut) ? CircularEaseOut : CircularEaseInOut;
            break;
        case CurveTypeExpo:
            currentFunction = (mode == EaseIn) ? ExponentialEaseIn : (mode == EaseOut) ? ExponentialEaseOut : ExponentialEaseInOut;
            break;
        case CurveTypeElastic:
            currentFunction = (mode == EaseIn) ? ElasticEaseIn : (mode == EaseOut) ? ElasticEaseOut : ElasticEaseInOut;
            break;
        case CurveTypeBack:
            currentFunction = (mode == EaseIn) ? BackEaseIn : (mode == EaseOut) ? BackEaseOut : BackEaseInOut;
            break;
        case CurveTypeBounce:
            currentFunction = (mode == EaseIn) ? BounceEaseIn : (mode == EaseOut) ? BounceEaseOut : BounceEaseInOut;
            break;
    }
    
    return currentFunction;
}

+(SKAction *)CreatePointTween:(CGVector)start EndPosition:(CGVector)end time:(NSTimeInterval)time easingFunction:(AHEasingFunction)easingFunction setterBlock:(void (^)(SKNode*, CGPoint))setter {
    SKAction *action = [SKAction customActionWithDuration:time actionBlock:^(SKNode *node, CGFloat elapsedTime) {
        CGFloat xValue = start.dx + easingFunction(elapsedTime/time) * (end.dx - start.dx);
        CGFloat yValue = start.dy + easingFunction(elapsedTime/time) * (end.dy - start.dy);
        setter(node, CGPointMake(xValue, yValue));
    }];
    return action;
}

+(SKAction *)CreateFloatTween:(CGFloat)start EndPosition:(CGFloat)end time:(NSTimeInterval)time easingFunction:(AHEasingFunction)easingFunction setterBlock:(void (^)(SKNode*, CGFloat))setter {
    SKAction *action = [SKAction customActionWithDuration:time actionBlock:^(SKNode *node, CGFloat elapsedTime) {
        CGFloat value = start + easingFunction(elapsedTime/time) * (end - start);
        setter(node, value);
    }];
    return action;
}

+(SKAction*) MoveToWithNode:(SKNode*)target EaseFunction:(CurveType)curve Mode:(EasingMode)mode Time:(NSTimeInterval)time ToVector:(CGVector)to{
    AHEasingFunction easingFunction = [SKEase GetEaseFunction:curve Mode:mode];
    CGPoint startPosition = target.position;
    
    SKAction *action = [self CreatePointTween:CGVectorMake(startPosition.x, startPosition.y) EndPosition:to time:time easingFunction:easingFunction setterBlock:^(SKNode* node, CGPoint point){[node setPosition:point];}];
    return action;
}

+(SKAction*) MoveFromWithNode:(SKNode*)target EaseFunction:(CurveType)curve Mode:(EasingMode)mode Time:(NSTimeInterval)time FromVector:(CGVector)from{
    AHEasingFunction easingFunction = [SKEase GetEaseFunction:curve Mode:mode];
    CGPoint startPosition = target.position;
    
    SKAction *action = [self CreatePointTween:from EndPosition:CGVectorMake(startPosition.x, startPosition.y) time:time easingFunction:easingFunction setterBlock:^(SKNode* node, CGPoint point){[node setPosition:point];}];
    return action;
}

+(SKAction*) ScaleToWithNode:(SKNode*)target EaseFunction:(CurveType)curve Mode:(EasingMode)mode Time:(NSTimeInterval)time ToValue:(CGFloat)to{
    AHEasingFunction easingFunction = [SKEase GetEaseFunction:curve Mode:mode];
    
    SKAction *action = [self CreateFloatTween:target.xScale EndPosition:to time:time easingFunction:easingFunction setterBlock:^(SKNode* node, CGFloat scale){[node setScale:scale];}];
    return action;
}

+(SKAction*) ScaleFromWithNode:(SKNode*)target EaseFunction:(CurveType)curve Mode:(EasingMode)mode Time:(NSTimeInterval)time FromValue:(CGFloat)from{
    AHEasingFunction easingFunction = [SKEase GetEaseFunction:curve Mode:mode];
    
    SKAction *action = [self CreateFloatTween:from EndPosition:target.xScale time:time easingFunction:easingFunction setterBlock:^(SKNode* node, CGFloat scale){[node setScale:scale];}];
    return action;
}

+(SKAction*) RotateToWithNode:(SKNode*)target EaseFunction:(CurveType)curve Mode:(EasingMode)mode Time:(NSTimeInterval)time ToValue:(CGFloat)to{
    AHEasingFunction easingFunction = [SKEase GetEaseFunction:curve Mode:mode];
    
    SKAction *action = [self CreateFloatTween:target.zRotation EndPosition:to time:time easingFunction:easingFunction setterBlock:^(SKNode* node, CGFloat rotation){[node setZRotation:rotation];}];
    return action;
}

+(SKAction*) RotateFromWithNode:(SKNode*)target EaseFunction:(CurveType)curve Mode:(EasingMode)mode Time:(NSTimeInterval)time FromValue:(CGFloat)from{
    AHEasingFunction easingFunction = [SKEase GetEaseFunction:curve Mode:mode];
    
    SKAction *action = [self CreateFloatTween:from EndPosition:target.zRotation time:time easingFunction:easingFunction setterBlock:^(SKNode* node, CGFloat rotation){[node setZRotation:rotation];}];
    return action;
}

+(SKAction*) FadeToWithNode:(SKNode*)target EaseFunction:(CurveType)curve Mode:(EasingMode)mode Time:(NSTimeInterval)time ToValue:(CGFloat)to{
    AHEasingFunction easingFunction = [SKEase GetEaseFunction:curve Mode:mode];
    
    SKAction *action = [self CreateFloatTween:target.alpha EndPosition:to time:time easingFunction:easingFunction setterBlock:^(SKNode* node, CGFloat alpha){node.alpha = alpha;}];
    return action;
}

+(SKAction*) FadeFromWithNode:(SKNode*)target EaseFunction:(CurveType)curve Mode:(EasingMode)mode Time:(NSTimeInterval)time FromValue:(CGFloat)from{
    AHEasingFunction easingFunction = [SKEase GetEaseFunction:curve Mode:mode];
    
    SKAction *action = [self CreateFloatTween:from EndPosition:target.zRotation time:time easingFunction:easingFunction setterBlock:^(SKNode* node, CGFloat alpha){node.alpha = alpha;}];
    return action;
}

@end
