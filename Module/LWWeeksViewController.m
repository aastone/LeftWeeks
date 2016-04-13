//
//  LWWeeksViewController.m
//  BlankSpace
//
//  Created by stone on 16/4/8.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "LWWeeksViewController.h"
#import "LWHomeViewModel.h"
#import "LWWeeksCollectionViewCell.h"
#import "UIColor+Tools.h"


static NSString *const kLWWeeksItemCellID = @"kLWWeeksItemCellID";

@interface LWWeeksViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation LWWeeksViewController

DECLARE_VIEWMODEL_GETTER(LWHomeViewModel)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([LWWeeksCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:kLWWeeksItemCellID];
    
    self.title = @"Left Weeks";
    
    self.contentLabel.text = [NSString stringWithFormat:@"%@ / %@", self.viewModel.pastWeeks, self.viewModel.maxWeeks];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.viewModel.maxWeeks.integerValue;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LWWeeksCollectionViewCell *cell = (LWWeeksCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kLWWeeksItemCellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    if (indexPath.row < self.viewModel.pastWeeks.integerValue) {
        
        cell.hintLabel.backgroundColor = UIColorFromHex(0xFFF9E4);
    }else {
        cell.hintLabel.backgroundColor = UIColorFromHex(0x9AFFC8);
    }
    return cell;
}

#pragma mark UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = 0;
    if ([self collectionView:collectionView numberOfItemsInSection:0] == 1) {
        width = collectionView.frame.size.width - 1;
    } else {
        width = collectionView.frame.size.width / 2 - 1;
    }
    width = collectionView.frame.size.width / 26 - 1;
    return CGSizeMake(10, 10);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
