//
//  RedioButton.h
//  RadioViewButtonDemo
//
//  Created by jing on 16/9/9.
//  Copyright © 2016年 jing. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface RedioButton : UIButton
typedef void(^ButtonBlock)(RedioButton *Button);
@property (nonatomic,copy)ButtonBlock block;
@end
