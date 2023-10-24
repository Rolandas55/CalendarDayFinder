//
//  ViewController.swift
//  CalendarDayFinder
//
//  Created by kraujalis.rolandas on 23/10/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayTextfield: UITextField!
    @IBOutlet weak var monthTextfield: UITextField!
    @IBOutlet weak var yearTextfield: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var findButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func findWeekDay() {
        #warning("find day of the year on Find tap")
        guard let year = Int(yearTextfield.text!) else {
            dayInputError(error: "year value is missing")
            return
        }
        guard let month = Int(monthTextfield.text!) else {
            dayInputError(error: "month value is missing")
            return
        }
        guard let day = Int(dayTextfield.text!) else {
            dayInputError(error: "day value is missing")
            return
        }
        if day <= 0 || day > 31 {
            dayInputError(error: "day must be between 1 and 31")
                return
        }
        if month <= 0 || month > 12 {
            dayInputError(error: "month must be between 1 and 12")
                return
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        guard let newDate = dateFormatter.date(from: "\(year)/\(month)/\(day)")
            else {
            dayInputError(error: "could not make a date from given numbers")
                return
            }
        dateFormatter.dateFormat = "EEEE"
        let weekDay = dateFormatter.string(from: newDate).capitalized
        resultLabel.text = weekDay
        findButton.setTitle("Clear", for: .normal)
    }
    
    @IBAction func findButtonTapped(_ sender: Any) {
        if findButton.titleLabel!.text == "Clear" {
            clearDayCheck()
        } else {
            findWeekDay()
        }
    }
    
    func clearDayCheck() {
        dayTextfield.text = ""
        monthTextfield.text = ""
        yearTextfield.text = ""
        findButton.setTitle("Find", for: .normal)
        resultLabel.text = "Result"
    }
    
    func dayInputError(error: String = "unknown") {
        DispatchQueue.main.async {
            let actionSheet = UIAlertController(title: "input error", message: error, preferredStyle: .actionSheet)
            actionSheet.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(actionSheet, animated: true)
        }
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "info" {
            guard let vc = segue.destination as? InfoViewController else { return }
            vc.infoVal = "This is Calendar Day Finder App"
            vc.descVal = "You can enter day, month and year. After pressing find button application prints what day of the week it is"
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

