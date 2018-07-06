//
//  Yoga.swift
//  Fitness
//
//  Created by Ludovic Ollagnier on 06/07/2018.
//  Copyright © 2018 Tec-Tec. All rights reserved.
//

import Foundation

struct Yoga: Activity {
    let name: String = "Yoga"
    let isIndoor: Bool = true
    let startDate: Date
    var endDate: Date
    var heartRate: Int
}
