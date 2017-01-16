//
//  ViewController.m
//  WaterRippleAnimation
//
//  Created by 刘俊俊 on 17/1/16.
//  Copyright © 2017年 刘俊俊. All rights reserved.
//

#import "ViewController.h"
#import "TextWarter.h"

#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIView *waterView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TextWarter *water = [[TextWarter alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth + 200, 200)];
    water.present = 0.7;
    [self.waterView addSubview:water];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
