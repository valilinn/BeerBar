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
    
    var beerIndex = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillDefaultValues()
        
    }
    
    private func fillDefaultValues() {
        let currentBeer = BarManager.sharedInstance.beers[beerIndex]
        title = "\(currentBeer.country) \(currentBeer.name)"
        beerImage.image = currentBeer.image
        switch currentBeer.type {
        case .dark:
            beerTypeLabel.text = "Dark"
        case .light:
            beerTypeLabel.text = "Light"
        }
        
        priceLabel.text = "Price: \(currentBeer.prices.0) EUR"
        
        updateVolume()
        checkVolume()
    }
    
    private func updateVolume() {
        volumeLabel.text = "Leftover beer: \(BarManager.sharedInstance.beers[beerIndex].volume) l"
    }
    
    private func checkVolume() {
        buyButton.isEnabled = getCurrentVolume() <= BarManager.sharedInstance.beers[beerIndex].volume
        
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
        
        let prices = BarManager.sharedInstance.pricesForBeer(with: beerIndex)
        
        switch sender.selectedSegmentIndex {
        case 0:
            priceLabel.text = "Price: \(prices.0) EUR"
        case 1:
            priceLabel.text = "Price: \(prices.1) EUR"
        case 2:
            priceLabel.text = "Price: \(prices.2) EUR"
        default:
            return
        }
//        updateVolume()
        checkVolume()
    }
    
    
    @IBAction func buyBeer(_ sender: Any) {

        BarManager.sharedInstance.buyBeer(with: beerIndex, volume: getCurrentVolume())
        
//        if beer.volume <= 0 {
//            checkVolume()
//        }
        
        updateVolume()
        checkVolume()
        parentController.completeBeers()

    }
    

}
