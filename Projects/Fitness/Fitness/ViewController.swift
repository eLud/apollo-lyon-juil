//
//  ViewController.swift
//  Fitness
//
//  Created by Ludovic Ollagnier on 05/07/2018.
//  Copyright © 2018 Tec-Tec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var redView: UIView!

    var button: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        button = UIButton(type: .infoLight)
        button?.translatesAutoresizingMaskIntoConstraints = false

        let centerConstraint = button?.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        view.addSubview(button!)

        let verticalPosition: NSLayoutConstraint?

        if #available(iOS 11.0, *) {
            verticalPosition = button?.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        } else {
            verticalPosition = button?.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor, constant: 8)
        }

        verticalPosition?.isActive = true
        centerConstraint?.isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addNewView(_ sender: Any) {

        let newView = UIView()
        newView.backgroundColor = UIColor.blue

        UIView.animate(withDuration: 0.4, animations: {
//            self.stackView.addArrangedSubview(newView)
//            self.stackView.insertArrangedSubview(self.redView, at: 0)
            self.stackView.arrangedSubviews[2].isHidden = !self.stackView.arrangedSubviews[2].isHidden

            self.stackView.arrangedSubviews[1].backgroundColor = .white

            self.stackView.layoutIfNeeded()

        }, completion: nil)
    }

}

