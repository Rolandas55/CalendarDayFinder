//
//  AppearanceViewController.swift
//  CalendarDayFinder
//
//  Created by kraujalis.rolandas on 24/10/2023.
//

import UIKit

class AppearanceViewController: UIViewController {

    @IBOutlet weak var textlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closItemTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func openSettings(_ sender: Any) {
        #warning("open ios simulator app, UIApplication")
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {return}
        UIApplication.shared.open(settingsURL)
    }
    
    
    func setLabelText() {
        var labelText = "Unable to specify UI style"
        if self.traitCollection.userInterfaceStyle == .dark {
            labelText = "Dark Mode is On"
        }
        if self.traitCollection.userInterfaceStyle == .light {
            labelText = "Light Mode is On"
        }
        #warning("from Light Mode is On to Dark Mode is On")
        textlabel.text = labelText
    }

}

extension AppearanceViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}
