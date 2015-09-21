//
//  WaterflowLayout.h
//  WaterfallsFlow
//
//  Created by MyMac on 15/9/21.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WaterflowLayout;
@protocol WaterflowLayoutDelegate <NSObject>

- (CGFloat)waterflowLayout:(WaterflowLayout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath;

@end


@interface WaterflowLayout : UICollectionViewLayout

@property (nonatomic,assign) UIEdgeInsets sectionInset; /**< */

@property (nonatomic,assign) CGFloat columnMargin; /**< 每列间距*/

@property (nonatomic,assign) CGFloat rowMargin; /**< 每行之间的间距*/

@property (nonatomic,assign) int columnsCount; /**< 显示多少列*/

@property (nonatomic,weak) id<WaterflowLayoutDelegate> delegate; /**< 代理*/

@end
