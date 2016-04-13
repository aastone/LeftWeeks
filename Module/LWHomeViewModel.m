//
//  LWHomeViewModel.m
//  BlankSpace
//
//  Created by stone on 16/4/8.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "LWHomeViewModel.h"
#import "NSDate+TimeUtil.h"
#import "NSNumber+Util.h"

static const NSInteger kNormalMaxAge = 80;

@implementation LWHomeViewModel

- (NSNumber *)getLeftWeeksWithUserBirthday:(NSNumber *)birthday maxAge:(NSNumber *)maxAge
{
    if (!maxAge) {
        maxAge = [NSNumber numberWithInteger:kNormalMaxAge];
    }
    
    NSInteger maxWeek = maxAge.integerValue * 365/7 + 1; // TODO
    _maxWeeks = [NSNumber numberWithInteger:maxWeek];
    
    NSDate *currentDate = [NSDate date];
    
    NSInteger pastDay = currentDate.dayString.integerValue - birthday.dateFromSeconds.dayString.integerValue;
    NSInteger pastMonth = currentDate.monthString.integerValue - birthday.dateFromSeconds.monthString.integerValue;
    NSInteger pastYear = currentDate.yearString.integerValue - birthday.dateFromSeconds.yearString.integerValue;
    
    if (pastDay < 0) {
        pastMonth -= 1;
        pastDay += 30;
    }
    
    if (pastMonth < 0) {
        pastYear -= 1;
        pastMonth += 12;
    }
    
    pastDay = pastYear*365 + pastMonth*12 + pastDay;
    
    NSInteger pastWeeks = pastDay / 7;
    
    _pastWeeks = [NSNumber numberWithInteger:pastWeeks];
    _leftWeeks = [NSNumber numberWithInteger:(maxWeek - pastWeeks)];
    
    return _leftWeeks;
}

- (void)weeksInYear
{
    //能被4整除的是闰年，有366天
}

@end
