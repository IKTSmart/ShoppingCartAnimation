//
//  ParabolaView.m
//  ShoppingCartAnimation
//
//  Created by IKT on 16/9/30.
//  Copyright © 2016年 www.tuanmob.com. All rights reserved.
//

#import "ParabolaView.h"

@interface ParabolaView ()

@property (nonatomic, copy) ParabolaFinish finish;

@end

@implementation ParabolaView

- (void)UsingFrame:(CGRect)frame startPoint:(CGPoint)start endPoint:(CGPoint)end During:(CGFloat)duration Finish:(ParabolaFinish)finish{
    [self setFrame:frame];
    [self.layer setCornerRadius:frame.size.width/2.0];
    [self setBackgroundColor:[UIColor redColor]];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
    [self setupAnmationStart:start End:end During:duration];
    self.finish = finish;
}

- (void)setupAnmationStart:(CGPoint)start End:(CGPoint)end During:(CGFloat)duration{
    //饿了么型
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat cpx = (start.x + end.x) / 2;
    CGFloat cpy = start.y;
    CGPathMoveToPoint(path, NULL, start.x, start.y);
    CGPathAddQuadCurveToPoint(path, NULL, cpx, cpy, end.x, end.y);
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path;
    CFRelease(path);
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.autoreverses = YES;
    scaleAnimation.toValue = [NSNumber numberWithFloat:(CGFloat)((arc4random() % 5) + 5) / 10.0];
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.delegate = self;
    groupAnimation.repeatCount = 1;
    groupAnimation.duration = duration;
    groupAnimation.removedOnCompletion = NO;
    groupAnimation.animations = @[scaleAnimation, animation];
    [self.layer addAnimation:groupAnimation forKey:@"position scale"];
}

//- (void)setupAnmationStart:(CGPoint)start End:(CGPoint)end During:(CGFloat)duration{
//    //抛物线型
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGFloat cpx = (start.x + end.x) / 2;
//    CGFloat cpy = -start.y;
//    CGPathMoveToPoint(path, NULL, start.x, start.y);
//    CGPathAddQuadCurveToPoint(path, NULL, cpx, cpy, end.x, end.y);
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    animation.path = path;
//    CFRelease(path);
//    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    scaleAnimation.autoreverses = YES;
//    scaleAnimation.toValue = [NSNumber numberWithFloat:(CGFloat)((arc4random() % 5) + 5) / 10.0];
//    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
//    groupAnimation.delegate = self;
//    groupAnimation.repeatCount = 1;
//    groupAnimation.duration = duration;
//    groupAnimation.removedOnCompletion = NO;
//    groupAnimation.animations = @[scaleAnimation, animation];
//    [self.layer addAnimation:groupAnimation forKey:@"position scale"];
//}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    self.finish();
    [self removeFromSuperview];
}

@end
