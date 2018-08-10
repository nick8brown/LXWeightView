//
//  LXWeightView.h
//  游标
//
//  Created by 曾令轩 on 2018/8/9.
//  Copyright © 2018年 曾令轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXWeightView : UIView

{
    CGFloat _indicatorOffset;
    int _indicatorIndex;
    double _indicatorMore;

}

@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong) NSArray *weightArray;

+ (instancetype)weightView;
+ (instancetype)weightViewWithFrame:(CGRect)frame;

- (void)show;
- (void)hide;

@end
