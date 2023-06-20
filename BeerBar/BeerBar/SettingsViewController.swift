//
//  SettingsViewController.swift
//  BeerBar
//
//  Created by Валентина Лінчук on 20/06/2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var zeroButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        zeroButton.setTitle("Reset", for: .normal)
        zeroButton.setTitle("Second term", for: .selected)
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func newShiftAction(_ sender: Any) {
        print("New shift started")
    }
    
    
    @IBAction func newResetAction(_ sender: Any) {
        zeroButton.isSelected.toggle()
        if zeroButton.isSelected {
            print("Reset")
        } else {
            print("Second term")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
