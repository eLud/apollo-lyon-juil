//
//  Running.swift
//  Fitness
//
//  Created by Ludovic Ollagnier on 06/07/2018.
//  Copyright © 2018 Tec-Tec. All rights reserved.
//

import Foundation
import CoreLocation

struct Running: Activity, Mappable {
    let name: String = "Running"
    let isIndoor: Bool
    let startDate: Date
    var endDate: Date
    var heartRate: Int

    var path: [CLLocation]
}
