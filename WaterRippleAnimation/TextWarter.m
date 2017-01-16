//
//  TextWarter.m
//  TextFriend
//
//  Created by 刘俊俊 on 16/11/16.
//  Copyright © 2016年 刘俊俊. All rights reserved.
//

#import "TextWarter.h"
#import "UIColor+color.h"

@interface TextWarter ()

@property (nonatomic, strong) NSTimer *myTimer;
@property (nonatomic, assign) CGRect myFrame;
@property (nonatomic, assign) CGFloat fa;

@end

@implementation TextWarter

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        _myFrame = frame;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)createTimer {
    
    if (!self.myTimer) {
        
        self.myTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(action) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.myTimer forMode:NSRunLoopCommonModes];
    }
    [self.myTimer setFireDate:[NSDate distantPast]];
}

- (void)action {
    
    // 让波浪移动效果
    _fa = _fa + 0.5; // 移动速度
    if (_fa >= _myFrame.size.width * 2.0) {
        
        _fa = 0;
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext(); // 路径
    // 创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 画水波纹
    CGContextSetLineWidth(context, 1); // 水波纹宽
    UIColor *color = [UIColor colorWithColorString:@"#000000" alpha:0.15];
//    UIColor *color = [UIColor clearColor];
    CGContextSetFillColorWithColor(context, [color CGColor]);// 背景色
    // 设置波峰高度
    float y = (1 - self.present) * rect.size.height;
    float y1 = (1 - self.present) * rect.size.height;
    
    CGPathMoveToPoint(path, NULL, 0, y);
    for (float x = 0; x <= rect.size.width * 3.0; x++) {
        
        // 构造正弦函数
        y = sin(x / (rect.size.width / 5) * M_PI  + _fa / (rect.size.width / 5) * M_PI) * _bigNumber + (1 - self.present) * rect.size.height;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    // 对正弦函数进行波长波谷约束
    CGPathAddLineToPoint(path, nil, rect.size.width, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, rect.size.height);
    
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(path);
    
    CGMutablePathRef path1 = CGPathCreateMutable();
    
    // 画第二条线
    CGContextSetLineWidth(context, 1);
//    UIColor *color1 = [UIColor clearColor];
    UIColor *color1 = [UIColor colorWithColorString:@"#000000" alpha:0.20];
    CGContextSetFillColorWithColor(context, [color1 CGColor]);
    
    CGPathMoveToPoint(path1, NULL, 0, y1);
    for (float x = 0; x <= rect.size.width; x++) {
        
        y1 = sin(x / (rect.size.width / 5) * M_PI + _fa / (rect.size.width / 5) * M_PI + M_PI) *_bigNumber + (1 - self.present) * rect.size.height;
        CGPathAddLineToPoint(path1, nil, x, y1);
    }
    CGPathAddLineToPoint(path1, nil, rect.size.height, rect.size.width);
    CGPathAddLineToPoint(path1, nil, 0, rect.size.height);
    
    CGContextAddPath(context, path1);
    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(path1);
}

- (void)setPresent:(CGFloat)present {
    
    _present = present;
    // 启动定时器
    [self createTimer];
    // 修改波浪幅度
    if (present <= 0.5) {
        
        _bigNumber = _myFrame.size.height * 0.15 * present * 2;
    }else {
        
        _bigNumber = 6.525f;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
