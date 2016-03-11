//
//  CustomeCollectionViewLayout.m
//  UICollectionViewDemo3
//
//  Created by 王享 on 16/3/11.
//  Copyright © 2016年 王享. All rights reserved.
//

#import "CustomeCollectionViewLayout.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
@interface CustomeCollectionViewLayout ()

//section的数量
@property (nonatomic) NSInteger numberOfSections;

//section中Cell的数量
@property (nonatomic) NSInteger numberOfCellsInSections;

//瀑布流的行数
@property (nonatomic) NSInteger columnCount;

//cell边距
@property (nonatomic) NSInteger padding;

//cell的最小高度
@property (nonatomic) NSInteger cellMinHeight;

//cell的最大高度，最大高度比最小高度小，以最小高度为准
@property (nonatomic) NSInteger cellMaxHeight;

//存储每个cell的随机高度，避免每次加载的随机高度都不同
@property (strong, nonatomic) NSMutableArray *cellHeightArray;

//cell的宽度
@property (nonatomic) CGFloat cellWidth;

//存储每列Cell的X坐标
@property (strong, nonatomic) NSMutableArray *cellXArray;

//记录每列Cell的最新Cell的Y坐标
@property (strong, nonatomic) NSMutableArray *cellYArray;




@end

@implementation CustomeCollectionViewLayout


-(void)prepareLayout{
    [super prepareLayout];
    
    [self initData];
    
    [self initCellWidth];
    
    [self initCellHeight];
}

/**
 * 该方法返回CollectionView的ContentSize的大小
 */
- (CGSize)collectionViewContentSize{
    
    CGFloat height = [self maxCellYArrayWithArray:_cellYArray];
    
    return CGSizeMake(SCREEN_WIDTH,  height);
}

/**
 * 该方法为每个Cell绑定一个Layout属性~
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    [self initCellYArray];
    
    NSMutableArray *array = [NSMutableArray array];
    
    //add cells
    for (int i=0; i < _numberOfCellsInSections; i++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        [array addObject:attributes];
    }
    
    return array;
    
}
/**
 * 该方法为每个Cell绑定一个Layout属性~
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGRect frame = CGRectZero;
    
    CGFloat cellHeight = [_cellHeightArray[indexPath.row] floatValue];
    
    NSInteger minYIndex = [self minCellYArrayWithArray:_cellYArray];
    
    CGFloat tempX = [_cellXArray[minYIndex] floatValue];
    
    CGFloat tempY = [_cellYArray[minYIndex] floatValue];
    
    frame = CGRectMake(tempX, tempY, _cellWidth, cellHeight);
    
    //更新相应的Y坐标
    _cellYArray[minYIndex] = @(tempY + cellHeight + _padding);
    
    //计算每个Cell的位置
    attributes.frame = frame;
    
    return attributes;
}

-(void)initData{
    _numberOfSections = [self.collectionView numberOfSections];
    _numberOfCellsInSections = [self.collectionView numberOfItemsInSection:0];
    _columnCount = 5;
    _padding = 2;
    _cellMinHeight=50;
    _cellMaxHeight=200;
    
}
/**
 * 根据Cell的列数求出Cell的宽度
 */
-(void)initCellWidth{
    //计算每个Cell的宽度
    _cellWidth = (SCREEN_WIDTH-(_columnCount-1)*_padding)/_columnCount;
    //为每个Cell计算X坐标
    _cellXArray = [[NSMutableArray alloc]initWithCapacity:_columnCount];
    for (int i =0 ; i < _columnCount; i++) {
        CGFloat tempX = i*(_cellWidth + _padding);
        [_cellXArray addObject:@(tempX)];
    }
    
}
-(void)initCellHeight{
    //随机生成Cell的高度
    _cellHeightArray = [[NSMutableArray alloc]initWithCapacity:_numberOfCellsInSections];
    for (int i = 0; i < _numberOfCellsInSections; i ++) {
        
        CGFloat cellHeight = arc4random() % (_cellMaxHeight - _cellMinHeight) + _cellMinHeight;
        
        [_cellHeightArray addObject:@(cellHeight)];
    }
    
}
/**
 * 初始化每列Cell的Y轴坐标
 */
- (void) initCellYArray{
    _cellYArray = [[NSMutableArray alloc] initWithCapacity:_columnCount];
    
    for (int i = 0; i < _columnCount; i ++) {
        [_cellYArray addObject:@(0)];
    }
}
/**
 * 求CellY数组中的最大值并返回
 */
- (CGFloat) maxCellYArrayWithArray: (NSMutableArray *) array{
    if (array.count == 0) {
        return 0.0f;
    }
    
    CGFloat max = [array[0] floatValue];
    for (NSNumber *number in array) {
        
        CGFloat temp = [number floatValue];
        
        if (max < temp) {
            max = temp;
        }
    }
    
    return max;
}


/**
 * 求CellY数组中的最小值的索引
 */
- (CGFloat) minCellYArrayWithArray: (NSMutableArray *) array{
    
    if (array.count == 0) {
        return 0.0f;
    }
    
    NSInteger minIndex = 0;
    CGFloat min = [array[0] floatValue];
    
    for (int i = 0; i < array.count; i ++) {
        CGFloat temp = [array[i] floatValue];
        
        if (min > temp) {
            min = temp;
            minIndex = i;
        }
    }
    
    return minIndex;
}


@end
