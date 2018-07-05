//: Playground - noun: a place where people can play

import UIKit

//: # Programmation orientée objet

// Nommage des types : CapitalisedCamelCase
// Nommage des variables/constantes/méthodes/fonctions : lowercasedCamelCase
// Noms clairs et compréhensible

//: ## Structures

// Pas d'héritage
// Fonctionnement par copie
// Memberwise init
struct Bottle {
    let capacity: Double
    var currentFilling: Double
    var content: String
    let material: String
    let isRecyclable: Bool

    mutating func empty() {
        currentFilling = 0
    }
}

var carrefourWater = Bottle(capacity: 0.5, currentFilling: 0.5, content: "Water", material: "Plastic", isRecyclable: true)
carrefourWater.empty()
carrefourWater.content = "Wine"
carrefourWater.isRecyclable

var bottle2 = carrefourWater
carrefourWater.currentFilling = carrefourWater.capacity

bottle2.currentFilling

//: ## Classes

class Glass {
    let capacity: Double
    var currentFilling: Double {
        willSet {
            currentFilling
            newValue
        }

        didSet {
            if currentFilling > capacity {
                currentFilling = capacity
            }
        }
    }
    var content: String
    let material: String
    let isRecyclable: Bool

    convenience init() {
        self.init(capacity: 0.5, material: "Glass", isRecyclable: true)
    }

    init(capacity: Double, material: String, isRecyclable: Bool) {
        self.capacity = capacity
        self.material = material
        self.isRecyclable = isRecyclable
        currentFilling = 0
        self.content = ""
    }

    func empty() {
        currentFilling = 0
    }
}

class BabyGlass: Glass {

    var text: String

    init() {
        text = ""
        super.init(capacity: 0.3, material: "PVC", isRecyclable: false)
    }


}

let pint = Glass()




