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
    

    
    var beerIndex = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fillDefaultValues()
        checkVolume() { [weak self] noBeer in
            if noBeer == false {self?.beerImage.image = UIImage(named: "nobeer")}
            
        }
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
        

        changeVolume(volumeSegmentControl)
        
        updateVolume()
        checkVolume()
    }
    
    private func updateVolume() {
        volumeLabel.text = "Leftover beer: \(BarManager.sharedInstance.beers[beerIndex].volume) l"
    }
    
     func checkVolume(noBeerImage: ((Bool) -> ())? = nil) {
        if getCurrentVolume() <= BarManager.sharedInstance.beers[beerIndex].volume {
            buyButton.isEnabled = true
            noBeerImage?(buyButton.isEnabled)
        } else {
            buyButton.isEnabled = false
            noBeerImage?(buyButton.isEnabled)

        }
    }
    
     func getCurrentVolume() -> Decimal {
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

        checkVolume()
    }
    
    
    @IBAction func buyBeer(_ sender: Any) {

        BarManager.sharedInstance.buyBeer(with: beerIndex, volume: getCurrentVolume())
        

        
        updateVolume()
        checkVolume() { [weak self] noBeer in
            if noBeer == false {self?.beerImage.image = UIImage(named: "nobeertext")}
            
        }
        

    }
    

}
