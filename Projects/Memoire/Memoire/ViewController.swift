//
//  ViewController.swift
//  Memoire
//
//  Created by Ludovic Ollagnier on 05/07/2018.
//  Copyright © 2018 Tec-Tec. All rights reserved.
//

import UIKit

class Human {
    var name: String
    weak var father: Human?
    var child: Human?

    init(name: String) {
        self.name = name
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0...100 {
            let adam = Human(name: "Adam")
            let filsDAdam = Human(name: "Caïn")

            adam.child = filsDAdam
            filsDAdam.father = adam
        }
        
        //--------
    }


}


