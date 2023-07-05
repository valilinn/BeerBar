//
//  MenuViewController.swift
//  BeerBar
//
//  Created by Валентина Лінчук on 17/06/2023.
//

import UIKit

class MenuViewController: UIViewController, BarManagerDelegate {
   

    
    @IBOutlet var beerButtons: [UIButton]!
    
    @IBOutlet var beerNames: [UILabel]!
    
    @IBOutlet var beerVolumes: [UILabel]!
    
    
    var beerIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Beer Heaven"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        completeBeers()
        
    }
    
    
    
    //Выводит номер каждого тега кнопок  beerButtons
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        guard let sender = sender as? UIButton,
              let destinationController = segue.destination as? BeerDetailsViewController else { return }
        let beerIndex = sender.tag
        
        
        destinationController.beerIndex = beerIndex
        self.beerIndex = beerIndex
        
        
    }
    
    
    func completeBeers() {
        for index in 0..<beerNames.count {
            
            beerNames[index].text = "\(BarManager.sharedInstance.beers[index].country) \(BarManager.sharedInstance.beers[index].name)"
            beerNames[index].textColor = UIColor.black
            beerVolumes[index].text = "Leftover beer: \(BarManager.sharedInstance.beers[index].volume) l"
            
            changeColorNameIfNoBeer(index)
        }
    }
    
    func changeColorNameIfNoBeer(_ index: Int) {
        if BarManager.sharedInstance.beers[index].volume < 0.33 {
            beerNames[index].textColor = UIColor.red
        }
    }
    
    func beersWasUpdated() {
        completeBeers()
    }
    
    
}
