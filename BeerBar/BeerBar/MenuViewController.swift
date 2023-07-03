//
//  MenuViewController.swift
//  BeerBar
//
//  Created by Валентина Лінчук on 17/06/2023.
//

import UIKit

class MenuViewController: UIViewController {


    @IBOutlet var beerButtons: [UIButton]!
    
    @IBOutlet var beerNames: [UILabel]!
    
    @IBOutlet var beerVolumes: [UILabel]!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Beer Heaven"
//        print(beerVolumes.count)
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
    }
    

    func completeBeers() {
        for index in 0..<beerNames.count {
            beerNames[index].text = "\(BarManager.sharedInstance.beers[index].country) \(BarManager.sharedInstance.beers[index].name)"
            
            beerVolumes[index].text = "Leftover beer: \(BarManager.sharedInstance.beers[index].volume) l"
        }
    }

    
    
    
}

