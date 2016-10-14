//
//  RedioView.m
//  RadioViewButtonDemo
//
//  Created by jing on 16/9/9.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "RedioView.h"
@interface RedioView ()
@property (nonatomic,strong)NSMutableArray<RedioButton *> *buttonArray;
@end
@implementation RedioView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
/**
 TOP_HETGHT 上下间隔
 BUTON_WIDTH 宽
 BUTON_HEIGHT 高
 */
#define TOP_HETGHT (10)
#define BUTON_WIDTH   (100)
#define BUTON_HEIGHT  (44)
#define LEFT_WIDTH ((self.frame.size.width-BUTON_WIDTH*3)/4)


/**
 在此方法自定义button的布局

 @param titleArray button的内容
 */
- (void)setTitleArray:(NSArray *)titleArray{
    _titleArray = titleArray;
    for (NSString *titleString in titleArray) {
        int index = (int)[titleArray indexOfObject:titleString];
        int row = index%3;//水平方向
        int line = index/3;//竖直方向
        CGRect frame = CGRectMake(LEFT_WIDTH+(LEFT_WIDTH+BUTON_WIDTH)*row, TOP_HETGHT+(TOP_HETGHT+BUTON_HEIGHT)*line, BUTON_WIDTH, BUTON_HEIGHT);
        [self addButtonByTitle:titleString AndFrame:frame AndIndex:index];
    }
}
- (void)addButtonByTitle:(NSString *)title AndFrame:(CGRect)frame AndIndex:(int)index{
    typeof(self)weakSelf =self;
    RedioButton *button = [[RedioButton alloc] initWithFrame:frame];
    button.tag = index;
    [button setTitle:title forState:UIControlStateNormal];
    button.block = ^(RedioButton *button){
        if (button.selected) return;
        [weakSelf allButtonSelectedNo];
        button.selected = YES;
        if (self.block) {
            self.block(button);
        }
    };
    [self.buttonArray addObject:button];
    [self addSubview:button];
}
- (void)allButtonSelectedNo{
    for (RedioButton *button in self.buttonArray) {
        button.selected = NO;
    }
}
//get
-(NSMutableArray<RedioButton *> *)buttonArray{
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
