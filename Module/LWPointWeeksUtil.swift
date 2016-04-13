//
//  LWPointWeeksUtil.swift
//  BlankSpace
//
//  Created by stone on 16/4/13.
//  Copyright © 2016年 stone. All rights reserved.
//

import UIKit

class LWPointWeeksUtil: NSObject {
    
    var age18 = pastWeeksInAge(18)
    
    var age20 = pastWeeksInAge(20)
}

func pastWeeksInAge(age: Int) -> Int {
    return age * 365 / 7
}