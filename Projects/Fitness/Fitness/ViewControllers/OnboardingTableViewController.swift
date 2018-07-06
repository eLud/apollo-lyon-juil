//
//  OnboardingTableViewController.swift
//  Fitness
//
//  Created by Ludovic Ollagnier on 06/07/2018.
//  Copyright © 2018 Tec-Tec. All rights reserved.
//

import UIKit

class OnboardingTableViewController: UITableViewController {

    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var pseudoTextField: UITextField!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var demoPickerTextField: UITextField!

    let datePicker = UIDatePicker(frame: CGRect.zero)
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureDateFormatter()
        configureBirthDatePicker()

        configureDemoPickerTextField()
    }

    @IBAction func saveAction(_ sender: Any) {

        guard let user = userFromForm() else {
            showFormIncompleteError()
            return
        }
        User.current = user
    }

    @IBAction func birthDateDidChange(_ sender: Any) {
        birthDateLabel.text = dateFormatter.string(from: birthDatePicker.date)
    }

    private func userFromForm() -> User? {

        guard let pseudo = pseudoTextField.text, pseudo.count > 2 else { return nil }
        guard let weightString = weightTextField.text, let weight = Double(weightString) else { return nil }
        guard let heightString = weightTextField.text, let height = Double(heightString) else { return nil }
        guard let gender = User.Gender(rawValue: genderSegmentedControl.selectedSegmentIndex) else { return nil }
        guard birthDatePicker.date.yearsToToday() > 6 else { return nil }

        let user = User(gender: gender, pseudo: pseudo, weight: weight, height: height, birthDate: birthDatePicker.date)

        return user
    }

    private func showFormIncompleteError() {
        let alert = UIAlertController(title: "Incomplete form", message: "The form seems to be incomplete", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)

        present(alert, animated: true, completion: nil)
    }

    private func configureDateFormatter() {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
    }

    private func configureBirthDatePicker() {
        birthDatePicker.datePickerMode = .date
        birthDatePicker.maximumDate = Date()
        birthDateLabel.text = dateFormatter.string(from: birthDatePicker.date)
    }

    private func configureDemoPickerTextField() {
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(datePickerDidScroll), for: .valueChanged)
        demoPickerTextField.inputView = datePicker
        demoPickerTextField.text = dateFormatter.string(from: datePicker.date)
    }

    @objc func datePickerDidScroll() {
        demoPickerTextField.text = dateFormatter.string(from: datePicker.date)
    }

}
