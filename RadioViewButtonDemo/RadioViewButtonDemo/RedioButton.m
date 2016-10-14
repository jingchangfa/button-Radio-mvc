
//
//  RedioButton.m
//  RadioViewButtonDemo
//
//  Created by jing on 16/9/9.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "RedioButton.h"

@implementation RedioButton
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = frame.size.height/2;
        
        [self viewSeting];
        
    }
    return self;
}
//在这个方法自定义button的样式
- (void)viewSeting{
    self.layer.borderColor = [UIColor redColor].CGColor;
    self.layer.borderWidth = 1.0f;
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self setTitleColor];
}
-(void)setTitleColor{
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
}
-(void)setBankColor:(BOOL)selected{
    self.backgroundColor = selected?[UIColor redColor]:[UIColor whiteColor];
}
-(void)buttonAction:(RedioButton *)button{
    if (self.block) {
        self.block(button);
    }
}
//
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    [self setBankColor:selected];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
