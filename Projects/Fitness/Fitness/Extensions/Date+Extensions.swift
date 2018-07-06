//
//  Date+Extensions.swift
//  Fitness
//
//  Created by Ludovic Ollagnier on 06/07/2018.
//  Copyright © 2018 Tec-Tec. All rights reserved.
//

import Foundation

extension Date {
    func yearsToToday() -> Int {
        let now = Date()
        let calendar = Calendar.current
        let component = calendar.dateComponents([.year], from: self, to: now)

        // Optional testing with guard
        guard let age = component.year else { return 0 }
        return age
    }
}
