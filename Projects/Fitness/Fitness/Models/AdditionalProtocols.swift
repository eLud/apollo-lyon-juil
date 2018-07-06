//
//  AdditionalProtocols.swift
//  Fitness
//
//  Created by Ludovic Ollagnier on 06/07/2018.
//  Copyright © 2018 Tec-Tec. All rights reserved.
//

import Foundation
import CoreLocation

protocol Mappable {
    var path: [CLLocation] { get set }
}

protocol Collective {
    var team: [Friend] { get set }
}
