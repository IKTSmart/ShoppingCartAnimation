//
//  ParabolaView.h
//  ShoppingCartAnimation
//
//  Created by IKT on 16/9/30.
//  Copyright © 2016年 www.tuanmob.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ParabolaFinish)(void);

@interface ParabolaView : UIView<CAAnimationDelegate>

- (void)UsingFrame:(CGRect)frame startPoint:(CGPoint)start endPoint:(CGPoint)end During:(CGFloat)duration Finish:(ParabolaFinish)finish;

@end
