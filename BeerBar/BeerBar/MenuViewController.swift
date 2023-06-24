//
//  MenuViewController.swift
//  BeerBar
//
//  Created by Валентина Лінчук on 17/06/2023.
//

import UIKit

class MenuViewController: UIViewController {

    
//    @IBOutlet weak var barName: UILabel!
    
    @IBOutlet var beerNames: [UILabel]!
    @IBOutlet var leftoverBeer: [UILabel]!
    
    @IBOutlet var volumeButtons: [UIButton]!
    
    var arrayOfAllBeerNames = ["Stella Artois", "Bud Light", "Corona Extra", "Heineken Lager", "Tyskie"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Beer Heaven"
        
        
//        barName.text = "Beer Heaven"
        //добавляет всем названия пива по порядку из массива arrayOfAllBeerNames
        for index in 0..<arrayOfAllBeerNames.count {
            beerNames[index].text = arrayOfAllBeerNames[index]
        }
    }

    
    

    
    
    
    
    @IBAction func buyBeer(_ sender: UIButton) {
        let tag = sender.tag
        let row = tag / 10
        let column = tag % 10
//        print("row: \(row) + column: \(column)")
        print("Bought a beer: \(beerNames[row].text!), with volume: ", volumeButtons[column].titleLabel?.text ?? "", "l" ) 
        
    }
    
}

