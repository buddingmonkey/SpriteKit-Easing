# SpriteKit-Easing

### Better Easing for SpriteKit!

SpriteKit by default uses the easing curve built by Apple into iOS. While this is an awesome curve to use for UI and more traditional mobile apps game development demands more than 2 functions. The goal of this library is to port a set of standard easing functions into the SpriteKit framework as actions.

SpriteKit-Easing contains the following easing functions:

* Linear 
* Quadratic 
* Cubic 
* Quartic 
* Quintic 
* Sine 
* Circular 
* Expo 
* Elastic 
* Back 
* Bounce 

## Usage
The library can directly interact with SKNodes or any Float or Point (for greater compatiblity).

The SKEasing functions generate an action that performs the ease. You can then use / control the action in the same manner you would for any other action in SpriteKit

```Objective-C
// Easing the position of a node to a point

SKNode * node = [[SKNode alloc]init];
node.position = CGPointMake(0, 0);

//Add child to scene here
[self addChild:node];

SKAction* action = [SKEase MoveToWithNode:node EaseFunction:CurveTypeSine Mode:EaseIn Time:.5f ToVector:CGVectorMake(100, 100)];

[node runAction:action]

// The rest of the library follows this syntax with the exception of the Float and Point
// Those add a setter that can be used to update a variable of your choice as the action updates
```

#### More to come... stay tuned...

Thanks to [AHEasing](https://github.com/warrenm/AHEasing) for helping me make sense of this easing nonsense!
