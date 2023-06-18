//
//  ViewController.swift
//  BeerBar
//
//  Created by Валентина Лінчук on 17/06/2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var barName: UILabel!
    
    @IBOutlet var beerNames: [UILabel]!
    @IBOutlet var leftoverBeer: [UILabel]!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet var volumeButtons: [UIButton]!
    
    var arrayOfAllBeerNames = ["Stella Artois", "Bud Light", "Corona Extra", "Heineken Lager", "Tyskie"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        barName.text = "Beer Heaven"
        zeroButton.setTitle("Reset", for: .normal)
        zeroButton.setTitle("Second term", for: .selected)
        
        //добавляет всем названия пива по порядку из массива arrayOfAllBeerNames
        for index in 0..<arrayOfAllBeerNames.count {
            beerNames[index].text = arrayOfAllBeerNames[index]
        }
        
// проверка в правильном ли порядке кнопки в массиве
//        for index in 0..<volumeButtons.count {
//            volumeButtons[index].titleLabel?.text = "\(index)"
//        }
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
    
    @IBAction func buyBeer(_ sender: UIButton) {
        let tag = sender.tag
        let row = tag / 10
        let column = tag % 10
//        print("row: \(row) + column: \(column)")
        print("Bought a beer: \(beerNames[row].text!), with volume: ", volumeButtons[column].titleLabel?.text ?? "", "l" )
        
    }
    
}

