//
//  UIImage+Utils.h
//  LuoChang
//
//  Created by Rick on 15/4/22.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utils)
+(UIImage *) stretchImageWithName:(NSString *) imageName;

+(UIImage *) stretchImageWithName:(NSString *) imageName widthScale:(CGFloat)widthScale heightScale:(CGFloat)heightScale;

/**
 *  根据颜色创建一张1*1的图片
 *
 *  @param colour 颜色
 *
 *  @return 创建好的图片
 */
+(UIImage *) imageWithColor:(UIColor *)colour;

/**
 *  指定宽度按比例缩放
 *
 *  @param sourceImage <#sourceImage description#>
 *  @param defineWidth <#defineWidth description#>
 *
 *  @return <#return value description#>
 */
+(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;


- (UIImage*)resize:(CGSize)size;
- (UIImage*)aspectFit:(CGSize)size;
- (UIImage*)aspectFill:(CGSize)size;
- (UIImage*)aspectFill:(CGSize)size offset:(CGFloat)offset;
@end
