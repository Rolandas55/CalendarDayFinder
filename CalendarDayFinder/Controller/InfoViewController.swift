//
//  InfoViewController.swift
//  CalendarDayFinder
//
//  Created by kraujalis.rolandas on 24/10/2023.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var appInfoLabel: UILabel!
    @IBOutlet weak var appDescLabel: UILabel!
    var infoVal: String?
    var descVal: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        #warning("assign value to labels")
        updateLabelsText()
    }
    
    @IBAction func unwindLabelsText(_ sender: UIStoryboardSegue) {}
    
    func updateLabelsText() {
        appInfoLabel.text = infoVal
        appDescLabel.text = descVal
    }
}
