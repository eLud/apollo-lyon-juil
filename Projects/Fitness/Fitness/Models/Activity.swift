//
//  Activity.swift
//  Fitness
//
//  Created by Ludovic Ollagnier on 06/07/2018.
//  Copyright © 2018 Tec-Tec. All rights reserved.
//

import Foundation

enum Intensity {
    case relaxing, low, medium, high, extreme, unknown
}

protocol Activity {
    var name: String { get }
    var isIndoor: Bool { get }
    var startDate: Date { get }
    var duration: TimeInterval { get }
    var endDate: Date { get }
    var intensity: Intensity { get }
    var heartRate: Int { get }
    var calories: Int { get }
}

extension Activity {
    var duration: TimeInterval {
        return endDate.timeIntervalSince(startDate)
    }

    var calories: Int {
        return Int((duration * Double(heartRate)) / 1000)
    }

    var intensity: Intensity {
        guard let user = User.current, let restingHeartRate = user.restingHeartRate else { return .unknown }

        let maxRecommendHeartRate = 200-user.age
        let delta = maxRecommendHeartRate - restingHeartRate
        let third = delta / 3

        switch heartRate {
        case ...restingHeartRate:
            return .relaxing
        case restingHeartRate...restingHeartRate+third:
            return .low
        case restingHeartRate+third...restingHeartRate+2*third:
            return .medium
        case restingHeartRate+2*third...maxRecommendHeartRate:
            return .high
        case maxRecommendHeartRate... :
            return .extreme
        default:
            return .unknown
        }
    }
}
