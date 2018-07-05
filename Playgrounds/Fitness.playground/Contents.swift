import UIKit

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

protocol Person {
    var pseudo: String { get }
    var height: Double { get }
    var age: Int { get }
}

struct Friend: Person {
    var pseudo: String
    var height: Double
    var age: Int
}

class User: Person {

    static var current: User?

    enum Gender {
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
        let tabCal = lastActivities.map { (activity) -> Int in
            return activity.calories
        }

        // Trouve le max d'une collection
        let max = lastActivities.max { (act1, act2) -> Bool in
            return act1.calories < act2.calories
        }

        // Transforme une sequence en une autre d'un autre type de taille potentiellement différente
        let yogaCal = lastActivities.compactMap { (activity) -> Int? in
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

import CoreLocation

protocol Mappable {
    var path: [CLLocation] { get set }
}
protocol Collective {
    var team: [Friend] { get set }
}

struct Yoga: Activity {
    let name: String = "Yoga"
    let isIndoor: Bool = true
    let startDate: Date
    var endDate: Date
    var heartRate: Int
}

struct Running: Activity, Mappable {
    let name: String = "Running"
    let isIndoor: Bool
    let startDate: Date
    var endDate: Date
    var heartRate: Int

    var path: [CLLocation]
}

struct Football: Activity, Collective {
    let name: String = "Football"
    let isIndoor: Bool
    let startDate: Date
    var endDate: Date
    var heartRate: Int

    var team: [Friend]
}

let df = DateFormatter()
df.dateFormat = "dd-MM-yy"
let birthDate = "13-08-86"
guard let date = df.date(from: birthDate) else { fatalError("Can't parse the date") }

var me = User(gender: .male, pseudo: "Ludovic", weight: 75, height: 183, birthDate: date)
me.restingHeartRate = 65

User.current = me

let startDate = Date()
let endDate = startDate.addingTimeInterval(1800)

let yoga = Yoga(startDate: startDate, endDate: endDate, heartRate: 60)
let yoga2 = Yoga(startDate: startDate, endDate: endDate, heartRate: 150)
let yoga3 = Yoga(startDate: startDate, endDate: endDate, heartRate: 120)
let yoga4 = Yoga(startDate: startDate, endDate: endDate, heartRate: 110)
let yoga5 = Yoga(startDate: startDate, endDate: endDate, heartRate: 180)
let foot = Football(isIndoor: false, startDate: startDate, endDate: endDate, heartRate: 150, team: [])

me.lastActivities = [yoga, yoga2, yoga3, yoga4, yoga5, foot]
me.bestOutdoorActivities

me.bestActivities
me.totalCalories

struct Climbing: Activity {
    let name: String = "Climbing"
    var isIndoor: Bool
    var startDate: Date
    var endDate: Date
    var heartRate: Int
}

extension UIColor {
    func fader() -> UIColor {
        let current = self
        //supr algo qui fade la couleur
        return current
    }
}

let rouge = UIColor.red
rouge.fader()

extension Climbing: Equatable {
    static func == (lhs: Climbing, rhs: Climbing) -> Bool {
        return lhs.startDate == rhs.startDate && lhs.duration == rhs.duration && lhs.heartRate == rhs.heartRate
    }
}


let tabString = ["maison", "téléphone", "vélo"]
let sorted = tabString.sorted(by: <)
sorted


func repete(time: Int, closure: (Int)->() ) {
    for i in 0...time {
        closure(i)
    }
}

repete(time: 10) { (param) in
    print("J'en suis à l'iteration \(param)")
}

func mySorted(tab: [String], isOrderedBefore: (String, String) -> Bool) -> [String] {
    var ordered = tab
    // recupère 2 éléments a comparer
    let a = ordered[0]
    let b = ordered[1]

    if !isOrderedBefore(a, b) {
        ordered.swapAt(0, 1)
    }
    return ordered
}
