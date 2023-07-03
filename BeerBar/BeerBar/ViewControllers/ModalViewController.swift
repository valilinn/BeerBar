//
//  ModalViewController.swift
//  BeerBar
//
//  Created by Валентина Лінчук on 20/06/2023.
//

import UIKit
import MessageUI


class ModalViewController: UIViewController, MFMailComposeViewControllerDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    

   
    @IBAction func telegram(_ sender: Any) {
        if let url = URL(string: "https://t.me/valinchuk") {
            UIApplication.shared.open(url)
        }
    }
    
    
    @IBAction func reallyEmail(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
                    let mail = MFMailComposeViewController()
                    mail.mailComposeDelegate = self
                    mail.setToRecipients(["valentinalinchuk@gmail.com"])
                    mail.setSubject("Subject")
                    mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
//                    mail.setCcRecipients(["valentinalinchuk@gmail.com"])
                    
                    present(mail, animated: true)
                } else {
                    // show failure alert
                }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            //... handle email screen actions
            controller.dismiss(animated: true)
        }

}
