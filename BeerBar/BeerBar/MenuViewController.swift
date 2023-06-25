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
    
    
    var beers: [Beer] = [
        Beer(name: "Tyskie",
             country: "🇵🇱",
             type: .light,
             prices: (1.5, 2.5, 3),
             volume: 100),
        Beer(name: "Бердичівське",
             country: "🇺🇦",
             type: .light,
             prices: (1.5, 2.5, 3),
             volume: 100),
        Beer(name: "Lech",
             country: "🇵🇱",
             type: .light,
             prices: (1.5, 2.5, 3),
             volume: 100),
        Beer(name: "Żywiec",
             country: "🇵🇱",
             type: .light,
             prices: (1.5, 2.5, 3),
             volume: 100),
        Beer(name: "Warka",
             country: "🇵🇱",
             type: .light,
             prices: (1.5, 2.5, 3),
             volume: 100),
        Beer(name: "Coors Light Lager Beer",
             country: "🇺🇸",
             type: .light,
             prices: (1.5, 2.5, 3),
             volume: 100),
        Beer(name: "Miller Lite Lager Beer",
             country: "🇺🇸",
             type: .light,
             prices: (1.5, 2.5, 3),
             volume: 100),
        Beer(name: "Corona Extra",
             country: "🇲🇽",
             type: .light,
             prices: (1.5, 2.5, 3),
             volume: 100),
        Beer(name: "Michelob ULTRA",
             country: "🇺🇸",
             type: .dark,
             prices: (1.5, 2.5, 3),
             volume: 100),
        Beer(name: "Modelo Especial",
             country: "🇲🇽",
             type: .light,
             prices: (1.5, 2.5, 3),
             volume: 100),
        Beer(name: "Guinness Draught",
             country: "🇮🇪",
             type: .dark,
             prices: (1.5, 2.5, 3),
             volume: 100),
        Beer(name: "Heineken Lager",
             country: "🇳🇱",
             type: .light,
             prices: (1.5, 2.5, 3),
             volume: 100),
        Beer(name: "Corona Premier",
             country: "🇲🇽",
             type: .light,
             prices: (1.5, 2.5, 3),
             volume: 100),
        Beer(name: "Bud Light Platinum",
             country: "🇺🇸",
             type: .light,
             prices: (1.5, 2.5, 3),
             volume: 100),
        Beer(name: "Stella Artois",
             country: "🇧🇪",
             type: .light,
             prices: (1.5, 2.5, 3),
             volume: 100)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Beer Heaven"
//        print(beerVolumes.count)
        completeBeers()

        
        
//        barName.text = "Beer Heaven"
        //добавляет всем названия пива по порядку из массива arrayOfAllBeerNames
//        for index in 0..<arrayOfAllBeerNames.count {
//            beerNames[index].text = arrayOfAllBeerNames[index]
//        }
    }

    //Выводит номер каждого тега кнопок  beerButtons
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {return}
        print(sender.tag)
    }
    

    func completeBeers() {
        for index in 0..<beerNames.count {
            beerNames[index].text = "\(beers[index].country) \(beers[index].name)"
            
            beerVolumes[index].text = "Leftover beer: \(beers[index].volume) l"
        }
    }

    
    
    
}

