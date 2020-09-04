//
//  MoreLabel.m
//  MoreLabelDemo
//
//  Created by maoqiang on 2020/9/4.
//  Copyright © 2020 maoqiang. All rights reserved.
//

#import "MoreLabel.h"
#import <CoreText/CoreText.h>
#import <Masonry/Masonry.h>

@implementation MoreLabel

-(void)showMoreWithMoreAtts:(NSAttributedString *)moreAtts{
    
    [self.superview setNeedsLayout];
    [self.superview layoutIfNeeded];
    
    [self sizeToFit];
    NSMutableString *str = [NSMutableString string];
    
    NSArray *strArray = [self getLinesArrayOfLabelRows];
    
    for (int i = 0; i < strArray.count ; i ++) {
            
        NSString *lineStr = strArray[i];
        [str appendString:lineStr];
        
        if (i == self.numberOfLines - 1 && self.numberOfLines != strArray.count) {
            
            NSString *s = @"......";
            NSInteger index = str.length - s.length;
            
            if (index <= 0) {
                return;
            }
            
            NSString *str1 = [str substringToIndex:index];
            
            NSMutableAttributedString *attS = [[NSMutableAttributedString alloc]initWithString:[str1 stringByAppendingString:s] attributes:self.attDict];
            self.attributedText = attS;
            
            UIButton *btn = [[UIButton alloc]init];
            [btn setAttributedTitle:moreAtts forState:UIControlStateNormal];
            [self addSubview:btn];
            
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.bottom.equalTo(self);
            }];
            
            break;
        }
    }

}

// 获取 Label 每行内容 得到一个数组
- (NSArray *)getLinesArrayOfLabelRows
{
    CGFloat labelWidth = self.frame.size.width;

    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:self.text attributes:@{NSFontAttributeName:self.font}];
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString(( CFAttributedStringRef)attStr);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,labelWidth,100000));
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    NSArray *lines = ( NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    for (id line in lines) {
        CTLineRef lineRef = (__bridge  CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        NSString *lineString = [self.text substringWithRange:range];
        [linesArray addObject:lineString];
    }
    CGPathRelease(path);
    CFRelease(frame);
    CFRelease(frameSetter);
    return (NSArray *)linesArray;
}

@end
