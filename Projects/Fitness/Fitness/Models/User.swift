//
//  User.swift
//  Fitness
//
//  Created by Ludovic Ollagnier on 06/07/2018.
//  Copyright © 2018 Tec-Tec. All rights reserved.
//

import Foundation

class User: Person {

    static var current: User?

    // enum avec raw value
    enum Gender: Int {
        case male
        case female
        case unknown
    }

    var pseudo: String
    var height: Double
    let gender: Gender

    //Computed property
    var age: Int {
        return birthDate.yearsToToday()
    }

    var weight: Double
    let birthDate: Date
    var restingHeartRate: Int?
    var preferedActivity: Activity?
    var lastActivities: [Activity]

    var totalCalories: Int {

        // Transforme une sequence en une autre d'un autre type de même taille
        let _ = lastActivities.map { (activity) -> Int in
            return activity.calories
        }

        // Trouve le max d'une collection
        let _ = lastActivities.max { (act1, act2) -> Bool in
            return act1.calories < act2.calories
        }

        // Transforme une sequence en une autre d'un autre type de taille potentiellement différente
        let _ = lastActivities.compactMap { (activity) -> Int? in
            guard activity is Yoga else { return nil }
            return activity.calories
        }

        // Combine les éléments d'une sequence en un autre élément
        return lastActivities.reduce(0) { (lastResult, activity) -> Int in
            return lastResult+activity.calories
        }
    }

    var bestOutdoorActivities: [Activity] {
        let outdoor = lastActivities.filter { (activity) -> Bool in
            return !activity.isIndoor
        }
        let orderedActivities = outdoor.sorted { (a1, a2) in
            return a1.calories > a2.calories
        }
        return orderedActivities
    }

    var bestActivities: [Activity] {
        let orderedActivities = lastActivities.sorted { (a1, a2) in
            return a1.calories > a2.calories
        }
        return orderedActivities
    }

    init(gender: Gender, pseudo: String, weight: Double, height: Double, birthDate: Date) {
        self.gender = gender
        self.pseudo = pseudo
        self.weight = weight
        self.height = height
        self.birthDate = birthDate

        restingHeartRate = nil
        lastActivities = []
    }
}
