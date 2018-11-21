//
//  DCCollectionHeaderLayout.m
//  WMall
//
//  Created by tom on 2018/11/19.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCCollectionHeaderLayout.h"

@interface DCCollectionHeaderLayout ()

/* 总的布局对象数组，包括item,sectionHeader,footerHeader */
@property (nonatomic, strong) NSMutableArray *attributesArray;
/* item的布局对象数组 */
@property (nonatomic, strong) NSMutableArray *itemsattributes;
/* header的布局对象数组 */
@property (nonatomic, strong) NSMutableArray *headerAttributes;
/* footer的布局对象数组 */
@property (nonatomic, strong) NSMutableArray *footerAttributes;
/* 计算collectionView的内容高度 */
@property (nonatomic, assign) CGFloat contentHeight;
/* collectionView自身的高度 */
@property (nonatomic, assign) CGFloat viewWidth;

@end

@implementation DCCollectionHeaderLayout

#pragma mark - initialize
- (instancetype)init {
	if (self = [super init]) {
		//设置间距的默认值
		self.headerViewHeight = 0.0;
		self.footerViewHeight = 0.0;
		self.interitemSpacing = 4.0;
		self.lineSpacing = 4.0;
		self.itemHeight = 30.0;
		self.itemInset = UIEdgeInsetsZero;
		self.headerInset = UIEdgeInsetsZero;
		self.footerInset = UIEdgeInsetsZero;
		self.labelFont = [UIFont systemFontOfSize:15.0];
	}
	return self;
}

/* 当collectionView布局item时 第一个执行的方法 */
- (void)prepareLayout {
	
	[super prepareLayout];
	
	self.viewWidth = SCREEN_WIDTH - self.itemInset.left - self.itemInset.right;
	//所有内容的布局属性数组
	self.attributesArray = [NSMutableArray array];
	
	//item的数据模型是2原数组，第一层数组包含的时section，第二层是每个section包含的item
	self.itemsattributes = [NSMutableArray array];
	//记录 collectionView的内容高度
	self.contentHeight = 0.0;
	
	/* 获取collectionView中的item的个数 */
	NSInteger sectionCount = [self.collectionView numberOfSections];
	/* 遍历得到的每个item 设置位置信息 */
	for (NSInteger i = 0; i < sectionCount; i++) {
		NSInteger itemCount = [self.collectionView numberOfItemsInSection:i];
		
		for (NSInteger j = 0; j < itemCount; j++) {
			
			[self setItemFrameWithIndexPath:[NSIndexPath indexPathForItem:j inSection:i]];
			
			if ((i == sectionCount - 1) && (j == itemCount - 1)) {
				//这里是当最后一个item的layoutAttributes设置完成后如果有设置footer 就要把footer添加到所有layoutAttributes数组
				if ([self.delegate respondsToSelector:@selector(collectionViewDynamicFooterSizeWithIndexPath:)]) {
					//获取最后一个item的layoutAttributes
					UICollectionViewLayoutAttributes *lastAttributes = self.attributesArray.lastObject;
					//添加footer 的 layoutAttributes
					[self makeFooterAttributeWithLastItemAttributes:lastAttributes];
					
					//获取新添加的footer的layoutAttributes
					UICollectionViewLayoutAttributes *footerAttributes = self.footerAttributes.lastObject;
					//计算总高度
					self.contentHeight = CGRectGetMaxY(footerAttributes.frame) + self.itemInset.bottom;
				}
			}
		}
	}
}


- (void)setItemFrameWithIndexPath:(NSIndexPath *)indexPath {
	
	//这里主要设置一下 item的初始frame
	CGFloat x = 0.0;
	CGFloat y = 0.0;
	CGFloat width = [self countItemSizeWithIndexPath:indexPath];
	CGFloat height = 30.0;
	
	//获取数组最后一个layoutAttributes,这样方便计算frame和判断是否需要计算新的section
	UICollectionViewLayoutAttributes *lastAttributes = self.attributesArray.lastObject;
	
	if (lastAttributes) {
		//如果数组有值代表不是设置第一个item
		if (lastAttributes.indexPath.section == indexPath.section) {
			//同一组
			if (CGRectGetMaxX(lastAttributes.frame) + self.interitemSpacing + width > self.viewWidth) {
				//需要换行
				x = self.itemInset.left + self.lineSpacing;
				y = CGRectGetMaxY(lastAttributes.frame) + self.lineSpacing;
			} else {
				//不需要换行
				x = CGRectGetMaxX(lastAttributes.frame) + self.interitemSpacing;
				y = CGRectGetMinY(lastAttributes.frame);
			}
		} else {
			//不同组
			//添加footer的布局，内部会判断是否需要添加
			[self makeFooterAttributeWithLastItemAttributes:lastAttributes];
			
			//添加一个新的section数组
			[self.itemsattributes addObject:[NSMutableArray array]];
			
			//这里重新获取最后一个layoutAttributes是因为如果加入了footer 总的layoutAttributes就回改变
			lastAttributes = self.attributesArray.lastObject;
			
			//添加header的布局，内部会判断是否需要添加
			[self makeHeaderAttributesWithIndexPath:indexPath lastItemAttributes:lastAttributes];
			
			//设置新的section的第一个item的frame
			x = self.itemInset.left + self.lineSpacing;
			y = CGRectGetMaxY(lastAttributes.frame) + self.lineSpacing * 2 + self.headerViewHeight;
		}
	} else {
		//这里是设置第一个section的item
		[self.itemsattributes addObject:[NSMutableArray array]];
		
		//添加header的布局，内部会判断是否需要添加
		[self makeHeaderAttributesWithIndexPath:indexPath lastItemAttributes:lastAttributes];
		
		//这里判断是否有header,如果有就获取最后一个layoutAttributes
		if (self.headerAttributes.count) {
			lastAttributes = self.attributesArray.lastObject;
		}
		
		//设置新的section的第一个item的frame
		x = self.itemInset.left + self.lineSpacing;
		y = self.lineSpacing + lastAttributes.size.height;
	}
	
	//设置每一个item的frame
	UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
	
	attributes.frame = CGRectMake(x, y, width, height);
	self.contentHeight = CGRectGetMaxY(attributes.frame) + self.lineSpacing;
	
	[self.itemsattributes[indexPath.section] addObject:attributes];
	[self.attributesArray addObject:attributes];
	
}


#pragma mark - 创建header、footer
- (void)makeHeaderAttributesWithIndexPath:(NSIndexPath *)indexPath lastItemAttributes:(UICollectionViewLayoutAttributes *)attributes {
	//设置第一个section的header
	UICollectionViewLayoutAttributes *headerAttributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:indexPath];
	
	CGFloat y = (attributes) ? CGRectGetMaxY(attributes.frame) + self.lineSpacing : self.itemInset.top;
	CGFloat headerWidth = 0.0;
	CGFloat headerHeight = 0.0;
	
	if ([self.delegate respondsToSelector:@selector(collectionViewDynamicHeaderSizeWithIndexPath:)]) {
		CGSize size = [self.delegate collectionViewDynamicHeaderSizeWithIndexPath:indexPath];
		
		headerWidth = size.width;
		headerHeight = size.height;
	} else {
		headerWidth = SCREEN_WIDTH - self.headerInset.left - self.headerInset.right;
		headerHeight = self.headerViewHeight;
	}
	
	if (headerHeight > 0.0) {
		headerAttributes.frame = CGRectMake(self.headerInset.left, y, headerWidth, headerHeight);
		
		[self.headerAttributes addObject:headerAttributes];
		[self.attributesArray addObject:headerAttributes];
	}
}


- (void)makeFooterAttributeWithLastItemAttributes:(UICollectionViewLayoutAttributes *)attributes {
	
	UICollectionViewLayoutAttributes *footerAttributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:attributes.indexPath];
	
	CGFloat footerWidth = 0.0;
	CGFloat footerHeight = 0.0;
	
	if ([self.delegate respondsToSelector:@selector(collectionViewDynamicHeaderSizeWithIndexPath:)]) {
		CGSize size = [self.delegate collectionViewDynamicHeaderSizeWithIndexPath:attributes.indexPath];
		footerWidth = size.width;
		footerHeight = size.height;
	} else {
		footerWidth = SCREEN_WIDTH - self.footerInset.left - self.footerInset.right;
		footerHeight = self.footerViewHeight;
	}
	
	if (footerHeight > 0) {
		footerAttributes.frame = CGRectMake(self.footerInset.left, CGRectGetMaxY(attributes.frame) + self.lineSpacing, footerWidth, footerHeight);
		[self.footerAttributes addObject:footerAttributes];
		[self.attributesArray addObject:footerAttributes];
	}
}

#pragma mark - 布局
//这个是返回所有header,footer,item属性的回调方法，一定要实现
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
	return self.attributesArray;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
	return self.itemsattributes[indexPath.section][indexPath.item];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
	if ( [elementKind isEqual: UICollectionElementKindSectionHeader] ) {
		return self.headerAttributes[indexPath.section];
	}else {
		return self.footerAttributes[indexPath.section];
	}
}

/** 4、设置滚动范围 */
// 这里可以处理 uicollectionview 内容不够屏幕高度不能滑动的问题,只要把 contentsize.height 设置成比屏幕高度大就可以了
- (CGSize)collectionViewContentSize {
	
	return CGSizeMake(0.0, self.contentHeight + self.itemInset.bottom);
}

- (CGFloat)countItemSizeWithIndexPath:(NSIndexPath *)indexPath {
	NSString *content = [self.delegate collectionViewItemSizeWithIndexPath:indexPath];
	
	CGSize size = [content sizeWithAttributes:@{NSFontAttributeName : self.labelFont}];
	
	return MAX(size.width + 24.0, self.itemHeight);
}


#pragma mark - getters and setters
// header 的布局属性数组
- (NSMutableArray *)headerAttributes {
	if ( !_headerAttributes ) {
		_headerAttributes = [NSMutableArray array];
	}
	return _headerAttributes;
}

// footer 的布局属性数组
- (NSMutableArray *)footerAttributes {
	if ( !_footerAttributes ) {
		_footerAttributes = [NSMutableArray array];
	}
	return _footerAttributes;
}


@end
