//
//  ViewController.m
//  MoreLabelDemo
//
//  Created by maoqiang on 2020/9/3.
//  Copyright © 2020 maoqiang. All rights reserved.
//

#import "ViewController.h"
#import "MoreLabel.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    MoreLabel *label = [[MoreLabel alloc]init];
    label.attDict = @{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:16]};
    
    label.numberOfLines = 2;
    label.text = @"182748917284712894781927489127489124182748917284712894781927489127489124182748917284712894781927489127489124";

    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.top.equalTo(self.view.mas_top).offset(100);
    }];
    
    [label showMoreWithMoreAtts:[[NSAttributedString alloc]initWithString:@"更多" attributes:@{NSForegroundColorAttributeName:[UIColor orangeColor],NSFontAttributeName:[UIFont systemFontOfSize:16]}]];
}


@end
