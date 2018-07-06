//
//  Person.swift
//  Fitness
//
//  Created by Ludovic Ollagnier on 06/07/2018.
//  Copyright © 2018 Tec-Tec. All rights reserved.
//

import Foundation

protocol Person {
    var pseudo: String { get }
    var height: Double { get }
    var age: Int { get }
}
