//
//  CollectionViewController.m
//  UICollectionViewDemo2
//
//  Created by 王享 on 16/3/10.
//  Copyright © 2016年 王享. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"CollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    self.collectionView.allowsMultipleSelection = YES;
    self.collectionView.backgroundColor =[UIColor whiteColor];
    
    
    UINib *headerNib = [UINib nibWithNibName: @"CollectionHeaderReusableView"
                                      bundle: [NSBundle mainBundle]];
    
    //注册重用View
    [self.collectionView registerNib: headerNib
          forSupplementaryViewOfKind: UICollectionElementKindSectionHeader
                 withReuseIdentifier: @"CollectionHeaderReusableView"];
    
    
    //注册FooterView
    UINib *footerNib = [UINib nibWithNibName: @"CollectionFooterReusableView"
                                      bundle:[ NSBundle mainBundle]];
    
    [self.collectionView registerNib: footerNib
          forSupplementaryViewOfKind: UICollectionElementKindSectionFooter
                 withReuseIdentifier: @"CollectionFooterReusableView"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [self changeSelectStateWithIndexPath:indexPath];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionHeaderReusableView" forIndexPath:indexPath];
        return view;
    }else{
    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CollectionFooterReusableView" forIndexPath:indexPath];
        return view;
    }
}

#pragma mark <UICollectionViewDelegateFlowLayout>
/**
 * 改变Cell的尺寸
 */
- (CGSize)collectionView: (UICollectionView *)collectionView
                  layout: (UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath: (NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return CGSizeMake(50, 50);
    }
    return CGSizeMake(60, 60);
}

/**
 * Section的上下左右边距--UIEdgeInsetsMake(上, 左, 下, 右);逆时针
 */
- (UIEdgeInsets)collectionView: (UICollectionView *)collectionView
                        layout: (UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex: (NSInteger)section{
    if (section == 0) {
        return UIEdgeInsetsMake(50, 50, 50, 50);
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

/**
 * Section中每个Cell的上下边距
 */
- (CGFloat)collectionView: (UICollectionView *)collectionView
                   layout: (UICollectionViewLayout*)collectionViewLayout
minimumLineSpacingForSectionAtIndex: (NSInteger)section{
    if (section == 0) {
        return 5.0f;
    }
    return 20.0f;
}

/**
 * Section中每个Cell的左右边距
 */
- (CGFloat)collectionView: (UICollectionView *)collectionView
                   layout: (UICollectionViewLayout*)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex: (NSInteger)section{
    if (section == 0) {
        return 5.0f;
    }
    return 20.0f;
}
/**
 * headerView的大小
 */
- (CGSize)collectionView: (UICollectionView *)collectionView
                  layout: (UICollectionViewLayout*)collectionViewLayout
referenceSizeForHeaderInSection: (NSInteger)section{
    return CGSizeMake(200, 50);
}

/**
 * footerView的大小
 */
- (CGSize)collectionView: (UICollectionView *)collectionView
                  layout: (UICollectionViewLayout*)collectionViewLayout
    referenceSizeForFooterInSection: (NSInteger)section{
    return CGSizeMake(200, 50);
}

#pragma mark <UICollectionViewDelegate>
/**
 * Cell是否可以高亮
 */
- (BOOL)collectionView: (UICollectionView *)collectionView
    shouldHighlightItemAtIndexPath: (NSIndexPath *)indexPath{
    
    return YES;
    
}

/**
 * 根据高亮状态修改背景图片
 */
- (void) changeHighlightCellWithIndexPath: (NSIndexPath *) indexPath{
    CollectionViewCell *currentHighlightCell = (CollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    [currentHighlightCell changeHighLightWithBool:currentHighlightCell.isHighlighted];
    if (currentHighlightCell.highlighted == YES){
        NSLog(@"第%ld个Section上第%ld个Cell变为高亮",indexPath.section ,indexPath.row);
        return;
    }
    
    if (currentHighlightCell.highlighted == NO){
        NSLog(@"第%ld个Section上第%ld个Cell变为非高亮",indexPath.section ,indexPath.row);
    }
}
/**
 * 如果Cell可以高亮，Cell变为高亮后调用该方法
 */
- (void)collectionView: (UICollectionView *)collectionView
didHighlightItemAtIndexPath: (NSIndexPath *)indexPath{
    
    [self changeHighlightCellWithIndexPath:indexPath];
}

/**
 * 如果Cell可以高亮，Cell从高亮变为非高亮调用该方法
 */
- (void)collectionView: (UICollectionView *)collectionView
didUnhighlightItemAtIndexPath: (NSIndexPath *)indexPath{
    
    [self changeHighlightCellWithIndexPath:indexPath];
    
}

/**
 * Cell是否可以选中
 */
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
/**
 * Cell多选时是否支持取消功能
 */
- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
/**
 * Cell选中调用该方法
 */
- (void)collectionView: (UICollectionView *)collectionView
didSelectItemAtIndexPath: (NSIndexPath *)indexPath{
    
    [self changeSelectStateWithIndexPath:indexPath];
}

/**
 * Cell取消选中调用该方法
 */
- (void)collectionView: (UICollectionView *)collectionView didDeselectItemAtIndexPath: (NSIndexPath *)indexPath{
    
    [self changeSelectStateWithIndexPath:indexPath];
}

/**
 * Cell根据Cell选中状态来改变Cell上Button按钮的状态
 */
- (void) changeSelectStateWithIndexPath: (NSIndexPath *) indexPath{
    //获取当前变化的Cell
    CollectionViewCell *currentSelecteCell = (CollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    currentSelecteCell.selectButton.selected =currentSelecteCell.selected;
    
    if (currentSelecteCell.selected == YES){
        NSLog(@"第%ld个Section上第%ld个Cell被选中了",indexPath.section ,indexPath.row);
        return;
    }
    if (currentSelecteCell.selected == NO){
        NSLog(@"第%ld个Section上第%ld个Cell取消选中",indexPath.section ,indexPath.row);
    }
}



/**
 * Cell将要出现的时候调用该方法
 */
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0){
    NSLog(@"第%ld个Section上第%ld个Cell将要出现",indexPath.section ,indexPath.row);
}

/**
 * Cell出现后调用该方法
 */
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"第%ld个Section上第%ld个Cell已经出现",indexPath.section ,indexPath.row);
}

/**
 * headerView或者footerView将要出现的时候调用该方法
 */
- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0){
    
    NSLog(@"第%ld个Section上第%ld个扩展View将要出现",indexPath.section ,indexPath.row);
    
}

/**
 * headerView或者footerView出现后调用该方法
 */
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"第%ld个Section上第%ld个扩展View已经出现",indexPath.section ,indexPath.row);
    
}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
