//
//  LXWeightView.m
//  游标
//
//  Created by 曾令轩 on 2018/8/9.
//  Copyright © 2018年 曾令轩. All rights reserved.
//

#import "LXWeightView.h"
#import "UIView+LX.h"

#define indexW 40
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]


@implementation LXWeightView

#pragma mark - lazy load
- (NSArray *)weightArray {
    if (!_weightArray) {
        NSMutableArray *tempArray = [NSMutableArray array];
        int weight = 0;
        do {
            [tempArray addObject:@(weight)];
            weight+=10;
        } while (weight <= 300);
        NSLog(@"_________%zd_____%@", tempArray.count ,tempArray);
        
        _weightArray = [NSArray arrayWithArray:tempArray];
    }
    return _weightArray;
}

#pragma mark - private func
+ (instancetype)weightView {
    LXWeightView *weightView = [[self class] loadNibNamed:NSStringFromClass([self class])];
    [weightView setupScrollView];
    return weightView;
}

+ (instancetype)weightViewWithFrame:(CGRect)frame {
    LXWeightView *weightView = [self weightView];
    weightView.frame = frame;
    return weightView;
}

- (void)setupScrollView {
    
    
    
    CGFloat labelY = 0;
    CGFloat labelW = indexW;
    CGFloat labelH = labelW;
    for (int i = 0; i < self.weightArray.count; i++) {
        CGFloat labelX = i * labelW;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelW, labelH)];
        label.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSString stringWithFormat:@"%@", self.weightArray[i]];
        
        [self.scrollView addSubview:label];
    }
    
    
    
    
    

}


- (void)layoutSubviews {
    _indicatorOffset = (self.frame.size.width-3) / 2;
    _indicatorIndex = _indicatorOffset / indexW;
    _indicatorMore = _indicatorOffset - _indicatorIndex*indexW;
    
    NSLog(@"+++++++++%f+++++++++%d+++++++++%f", _indicatorOffset, _indicatorIndex, _indicatorMore);
    
    self.scrollView.contentSize = CGSizeMake((self.weightArray.count)*indexW+(_indicatorIndex-1)*indexW+_indicatorMore+13, 0);
    self.scrollView.contentInset = UIEdgeInsetsMake(0, (_indicatorIndex-1)*indexW+_indicatorMore, 0, 0);

    
    
    //默认70, 70排数组第8个
    [self.scrollView setContentOffset:CGPointMake(8*indexW-_indicatorOffset, 0) animated:YES];
    
}




#pragma mark - 显示
- (void)show {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.5;
    }];
}

#pragma mark - 隐藏
- (void)hide {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    }];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetX = self.scrollView.contentOffset.x;
    CGFloat indicatorOffset = (self.frame.size.width-3) / 2;
    CGFloat totalOffset = offsetX + indicatorOffset;
    int index = totalOffset / indexW;
    
    double indexHeight = [self.weightArray[index-1] doubleValue];
    NSLog(@"___________%f_________%f_______%d___________%f", offsetX, indicatorOffset, index,  indexHeight);
    
    double more = totalOffset - index*indexW;
    double moreHeight = more/indexW * 10;
    NSLog(@"___________%f_________%f", more, moreHeight);
    
    double weight = indexHeight + moreHeight;
    self.weightLabel.text = [NSString stringWithFormat:@"%.1f KG", weight];
}


    



@end
