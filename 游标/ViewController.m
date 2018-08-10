//
//  ViewController.m
//  游标
//
//  Created by 曾令轩 on 2018/8/9.
//  Copyright © 2018年 曾令轩. All rights reserved.
//

#import "ViewController.h"
#import "LXWeightView.h"

@interface ViewController ()




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    LXWeightView *weightView = [LXWeightView weightViewWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:weightView];
    
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
