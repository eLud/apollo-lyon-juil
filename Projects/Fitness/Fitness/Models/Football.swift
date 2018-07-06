//
//  Football.swift
//  Fitness
//
//  Created by Ludovic Ollagnier on 06/07/2018.
//  Copyright © 2018 Tec-Tec. All rights reserved.
//

import Foundation

struct Football: Activity, Collective {
    let name: String = "Football"
    let isIndoor: Bool
    let startDate: Date
    var endDate: Date
    var heartRate: Int

    var team: [Friend]
}
