//
//  LWHomeViewModel.h
//  BlankSpace
//
//  Created by stone on 16/4/8.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "BSViewModel.h"

@interface LWHomeViewModel : BSViewModel

- (NSNumber *)getLeftWeeksWithUserBirthday:(NSNumber *)birthday maxAge:(NSNumber *)maxAge;


@property (nonatomic, strong) NSNumber *maxWeeks;
@property (nonatomic, strong) NSNumber *pastWeeks;
@property (nonatomic, strong) NSNumber *leftWeeks;


@end
