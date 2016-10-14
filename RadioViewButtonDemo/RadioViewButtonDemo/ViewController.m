//
//  ViewController.m
//  RadioViewButtonDemo
//
//  Created by jing on 16/9/9.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "ViewController.h"
#import "RedioView.h"
@interface ViewController ()
@property (nonatomic,strong)RedioView *redioView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.redioView.block = ^(RedioButton *button){
        NSLog(@"点击的%d",(int)button.tag);
    };
    self.redioView.titleArray = @[@"111",@"222",@"333",@"444",@"555",@"666",@"777",@"888",@"999"];
    [self.view addSubview:self.redioView];
    // Do any additional setup after loading the view, typically from a nib.
}
-(RedioView *)redioView{
    if (!_redioView) {
        _redioView = [[RedioView alloc] initWithFrame:CGRectMake(0, 40, 375, 200)];
    }
    return _redioView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
