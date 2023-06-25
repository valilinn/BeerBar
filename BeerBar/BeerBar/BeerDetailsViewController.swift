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
    
    
    
    @IBOutlet weak var beerImage: UIImageView!
    
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
    
    func fillDefaultValues() {
        title = "\(beer.country) \(beer.name)"
    }
    
    @IBAction func changeVolume(_ sender: Any) {
    }
    
    
    @IBAction func buyBeer(_ sender: Any) {
    }
    
    

}
