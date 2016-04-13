//
//  LWHomeViewController.m
//  BlankSpace
//
//  Created by stone on 16/4/8.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "LWHomeViewController.h"
#import "LWHomeViewModel.h"
#import "NSDate+TimeUtil.h"
#import "LWWeeksViewController.h"

@interface LWHomeViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *birthDatePicker;

DECLARE_VIEWMODEL(LWHomeViewModel)

@end

@implementation LWHomeViewController

DECLARE_VIEWMODEL_GETTER(LWHomeViewModel)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)choseBirthDate
{
    
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    LWWeeksViewController *vc = segue.destinationViewController;
//    
//    vc.viewModel.maxWeeks = self.viewModel.maxWeeks;
//    vc.viewModel.leftWeeks = self.viewModel.leftWeeks;
//    vc.viewModel.pastWeeks = self.viewModel.pastWeeks;
//    [vc.collectionView reloadData];
}

#pragma mark - Actions

- (IBAction)birthDatePickerValueChanged:(id)sender {
    
}

- (IBAction)saveButtonPressed:(id)sender {
    NSNumber *leftWeeks = [self.viewModel getLeftWeeksWithUserBirthday:self.birthDatePicker.date.unixTimestampInSeconds maxAge:nil];
    NSLog(@"leftWeeks:%@", leftWeeks);
    
    LWWeeksViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"weeksVC"];
    vc.viewModel.maxWeeks = self.viewModel.maxWeeks;
    vc.viewModel.leftWeeks = self.viewModel.leftWeeks;
    vc.viewModel.pastWeeks = self.viewModel.pastWeeks;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
