//
//  SettingsViewController.swift
//  BeerBar
//
//  Created by Валентина Лінчук on 20/06/2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var zeroButton: UIButton!
    
    @IBOutlet weak var todaySalaryLabel: UILabel!
    
    @IBOutlet weak var totalSalaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zeroButton.setTitle("Reset", for: .normal)
        zeroButton.setTitle("Second term", for: .selected)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateSalaries()
        
    }
    
    func updateSalaries() {
        todaySalaryLabel.text =
        """
        Revenue today:
        \(BarManager.sharedInstance.todaySalary)€
        """
        
        totalSalaryLabel.text =
        """
        Total revenue:
        \(BarManager.sharedInstance.totalSalary)€
        """
    }
    
    @IBAction func newShiftAction(_ sender: Any) {
        BarManager.sharedInstance.newDay()
        updateSalaries()
    }
    
    //becomeNewConstitution
    @IBAction func newResetAction(_ sender: Any) {
        BarManager.sharedInstance.resetAll()
        updateSalaries()
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
