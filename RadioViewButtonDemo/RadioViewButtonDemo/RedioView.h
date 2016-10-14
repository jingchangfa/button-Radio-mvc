//
//  RedioView.h
//  RadioViewButtonDemo
//
//  Created by jing on 16/9/9.
//  Copyright © 2016年 jing. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "RedioButton.h"
typedef void(^selectedButtonBlcok)(RedioButton *button);
@interface RedioView : UIView
@property (nonatomic,strong)NSArray *titleArray;//用来创建button的
@property (nonatomic,copy)selectedButtonBlcok block;
@end
