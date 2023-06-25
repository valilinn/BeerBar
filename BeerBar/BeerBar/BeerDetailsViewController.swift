//
//  BeerDetailsViewController.swift
//  BeerBar
//
//  Created by Валентина Лінчук on 25/06/2023.
//

import UIKit

class BeerDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var beerTypeLabel: UILabel!
    
    @IBOutlet weak var volumeLabel: UILabel!
    
    @IBOutlet weak var volumeSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    @IBOutlet weak var buyButton: UIButton!
    
    @IBOutlet weak var beerImage: UIImageView!
    
    
    
    var parentController: MenuViewController!
    
    var beer = Beer(name: "Error",
                    country: "",
                    type: .light,
                    prices: (0, 0, 0),
                    volume: 0)
    var beerIndex = 0
    
    

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillDefaultValues()
        
    }
    
    private func fillDefaultValues() {
        title = "\(beer.country) \(beer.name)"
        
        switch beer.type {
        case .dark:
            beerTypeLabel.text = "Dark"
        case .light:
            beerTypeLabel.text = "Light"
        }
        
        priceLabel.text = "Price: \(beer.prices.0) EUR"
        
        updateVolume()
        checkVolume()
    }
    
    private func updateVolume() {
        volumeLabel.text = "Leftover beer: \(beer.volume) l"
    }
    
    private func checkVolume() {
        buyButton.isEnabled = getCurrentVolume() <= beer.volume
        
    }
    
    private func getCurrentVolume() -> Decimal {
        switch volumeSegmentControl.selectedSegmentIndex {
        case 0:
            return 0.33
        case 1:
            return 0.5
        case 2:
            return 1.0
        default:
            return 0
        }
    }

    
  
    @IBAction func changeVolume(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            priceLabel.text = "Price: \(beer.prices.0) EUR"
        case 1:
            priceLabel.text = "Price: \(beer.prices.1) EUR"
        case 2:
            priceLabel.text = "Price: \(beer.prices.2) EUR"
        default:
            return
        }
        updateVolume()
    }
    
    
    @IBAction func buyBeer(_ sender: Any) {

        beer.volume -= getCurrentVolume()
        updateVolume()
        parentController.beers[beerIndex].volume = beer.volume
        parentController.completeBeers()

    }
    

}
