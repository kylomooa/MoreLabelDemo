//
//  MoreLabel.h
//  MoreLabelDemo
//
//  Created by maoqiang on 2020/9/4.
//  Copyright © 2020 maoqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MoreLabel : UILabel
@property (nonatomic, strong) NSDictionary *attDict;
-(void)showMoreWithMoreAtts:(NSAttributedString *)moreAtts;
@end

NS_ASSUME_NONNULL_END
