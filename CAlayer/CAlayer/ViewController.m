//
//  ViewController.m
//  CAlayer
//
//  Created by genilex3 on 16/7/1.
//  Copyright © 2016年 wei63w. All rights reserved.
//

#import "ViewController.h"
#define WIDTH 50



@interface ViewController ()

@property (nonatomic, strong) CALayer *layer;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self drawMyLayer];
    
}


-(void)drawMyLayer{
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    _layer = [[CALayer alloc]init];
    _layer.backgroundColor = [UIColor colorWithRed:0 green:146/255.0 blue:1.0 alpha:1.0].CGColor;
    //设置中心点
    _layer.position=CGPointMake(size.width/2, size.height/2);
    //设置大小
    _layer.bounds=CGRectMake(0, 0, WIDTH,WIDTH);
    //设置圆角,当圆角半径等于矩形的一半时看起来就是一个圆形
    _layer.cornerRadius=WIDTH/2;
    //设置阴影
    _layer.shadowColor=[UIColor grayColor].CGColor;
    _layer.shadowOffset=CGSizeMake(2, 2);
    _layer.shadowOpacity=.9;
    //设置边框
    //    layer.borderColor=[UIColor whiteColor].CGColor;
    //    layer.borderWidth=1;
    //设置锚点
    //    layer.anchorPoint=CGPointZero;
    [self.view.layer addSublayer:_layer];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
//    CALayer *layer=self.view.layer.sublayers[0];
    CGFloat width=_layer.bounds.size.width;
    if (width==WIDTH) {
        width=WIDTH*4;
    }else{
        width=WIDTH;
    }
    _layer.bounds=CGRectMake(0, 0, width, width);
    _layer.position=[touch locationInView:self.view];
    _layer.cornerRadius=width/2;
    [_layer setNeedsDisplay];
}


@end
