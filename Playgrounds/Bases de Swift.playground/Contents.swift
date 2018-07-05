//: Playground - noun: a place where people can play

import Foundation

// alt+( : {
// alt+shift+( : [
// alt+shift+L : |
// alt+shift+/ : \

//: # Bases de Swift
//: ## Syntaxes et principes
//: ### Constantes
let languageName: String = "Swift"
//languageName.append(" 4.1")

var version: Double = 4.1
let introduced: Int = 2014
let isAwesome: Bool = true
var floatVersion: Float = 4.1
//: ### Typage fort
version = Double(floatVersion)
floatVersion = Float(version)
floatVersion = Float(introduced)
//: ### Inférence
let a = 5
let b = 2
let c = Double(a) / Double(b)

let firstName = "Ludovic"
let temperature: Float = 30
let gender: Character = "F"

//let done: Bool
//if firstName == "Ludovic" {
//    done = true
//} else {
//    done = false
//}

//if done {
//    print("toto", "test")
//    print("toto", "test", separator: ",", terminator: "")
//}

//: ## Opérateurs
// : Idem aux autres langages (C/ObjC)

//: ## Chaines de caractères

var aString = "kyzfz 😍😴"
aString.count
aString.isEmpty

aString.unicodeScalars.count

aString.append("T")

let concat = aString + "az\nerty"

let multiline = """
    Direct Manipulation
    The direct manipulation of onscreen content engages people and facilitates understanding. Users experience direct manipulation when they rotate the device or use gestures to affect onscreen content. Through direct manipulation, they can see the immediate, visible results of their actions.
    """
print(multiline)
multiline.hasPrefix("Direct")
multiline.hasSuffix("actions")
let splitted = multiline.split(separator: ".")

multiline.capitalized
multiline.uppercased()

let s1 = "Maçon"
let s2 = "macon"

s1.lowercased() == s2.lowercased()

let result = s1.compare(s2, options: [.diacriticInsensitive, .caseInsensitive])
if result == .orderedSame {
    print("Same strings")
}

//: ## Collections

//: ### Array
// List typé, taille variable/dynamique
// -> Array

//Déclaration
var anArray = ["Lyon", "Paris"]
//Ajout
anArray.append("Marseille")
//Récupération
anArray[2]
//Modification
anArray[1] = "Lille"
anArray.insert("Paris", at: 0)
anArray
anArray += ["Bordeaux"]
for ville in anArray {
    print(ville)
}
anArray.joined(separator: ",")

let subArray = anArray[0...2]
let oneToEnd = anArray[1...]
anArray[0...1] = ["SF", "NYC", "WDC"]
anArray

anArray.index(of: "SF")
anArray.contains("NYC")
anArray.count
anArray.isEmpty

let emptyArray: [String] = []
let emptyArray2: Array<String> = []
let emptyArray3 = [String]()
let emptyArray4 = Array<String>()

anArray.sorted()

let fourreTout = ["Test", 6, 5.6] as [Any]
for truc in fourreTout where truc is Int {
    print(truc)
}
for i in 0...10 where i%2 == 0 {
    print(i)
}

//: ### Dictionary

//values: Any
//keys: Hashable

var dict = ["firstName":"Ludovic", "lastName":"Ollagnier"]
let name = dict["firstName"]
dict["city"] = "Paris"
dict["city"] = "Lyon"
dict.count

let keys = [String](dict.keys)
let values = [String](dict.values)
dict["city"] = nil
dict.removeValue(forKey: "city")

let emptyDict: [String:String] = [:]
let emptyDict2: Dictionary<String, String> = [:]
let emptyDict3 = [String:String]()
let emptyDict4 = Dictionary<String, String>()

for truc in dict {
    truc.key
    truc.value
}

for (clé, valeur) in dict {
    clé
    valeur
}

//: ### Set

// Collection non ordonnée / non indexée d'objets uniques

//member: Hashable
var stringSet: Set = ["Paris", "Lyon"]
stringSet.count
stringSet.insert("Paris")
stringSet.count

stringSet.contains("Paris")
stringSet.remove("Paris")

anArray.append("NYC")
anArray
anArray.count
let citiesSet = Set(anArray)
citiesSet.count

//: ## Conditions
//: ### Guard

let lifetimeEsperance = 85

func happyBirthday(age: Int) {

    guard age >= 0 else { return }
    guard age <= lifetimeEsperance else { return }

    print("Happy birthday!!")
}

//: ## Fonctions

//: ### Sans paramètres
func doSomething() {

}

doSomething()

//: ### Avec paramètres
func eat(_ food: Food, with friend: String) {
    print(food)
    print(friend)
}

struct Food {

}

let pizza = Food()
eat(pizza, with: "Paul")

//: ### Retours

func remove(_ firstNumber: Int, from secondNumber: Int) -> Int {

    return secondNumber - firstNumber
}
remove(3, from: 2)

// (Int, Int)->(Int, Int, Int, String)
func add(_ n1: Int, to n2: Int) -> (firstNumber: Int, secondNumber: Int, result: Int, resultString: String) {

    return (n1, n2, n1+n2, String(n1+n2))
}

// (Int, Int) : Tuple / multiplet / n-uplet
let additionResult = add(5, to: 6)
additionResult.result

let (n1, n2, res, str) = add(5, to: 6)

let aTuple = (x: n1, y: anArray)
aTuple.y

//: ### Variadic parameters
func myPrint(things: String..., separator: Character = ",") {
    for str in things {
        print(str)
    }
}

myPrint(things: "a", "b", "c", separator: ",")

func test(a: Int, b: Int) {

}

func test(a: Int, b: String) {

}

//Nested functions
func test(trucA: Int, trucB: Int) {
    func truc() {
        func truc2() {

        }

        truc2()
    }
    truc()
    truc()
    truc()
}

//In and out
func increment(a: inout Int) {
    a += 1
}

var number = 10
increment(a: &number)
number

//: ## Optionals

// Optional testing with if
//        if let age = component.year {
//            return age
//        }

//let nilCoalescingOperator = component.year ?? 0



class Client {

    let name: String
    var creditCard: CreditCard?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("Deinited " + name)
    }
}

class CreditCard {

    unowned let owner: Client
    let number: String


    init(owner: Client, number: String) {
        self.owner = owner
        self.number = number
    }

    deinit {
        print("Deinited card")
    }
}

var me: Client? = Client(name: "Ludovic")
let creditCard = CreditCard(owner: me!, number: "123456789")
me?.creditCard = creditCard

me = nil

