//
//  UIView+LX.m
//  HZGAPP
//
//  Created by 曾令轩 on 16/4/29.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import "UIView+LX.h"

@implementation UIView (LX)

- (UIViewController *)getController {
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

+ (instancetype)loadNibNamed:(NSString *)nibNamed {
    return [[[NSBundle mainBundle] loadNibNamed:nibNamed owner:nil options:nil] lastObject];
}

@end
