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
             prices: (1.3, 2.3, 3.3),
             volume: 100,
             image: UIImage(named: "tyskie")!),
        Beer(name: "Бердичівське",
             country: "🇺🇦",
             type: .light,
             prices: (1.0, 2.7, 3.6),
             volume: 100,
             image: UIImage(named: "бердичівське")!),
        Beer(name: "Lech",
             country: "🇵🇱",
             type: .light,
             prices: (1.4, 2.9, 4),
             volume: 100,
             image: UIImage(named: "lech")!),
        Beer(name: "Żywiec",
             country: "🇵🇱",
             type: .light,
             prices: (1.4, 2.4, 3.4),
             volume: 100,
             image: UIImage(named: "zywiec")!),
        Beer(name: "Warka",
             country: "🇵🇱",
             type: .light,
             prices: (1.7, 2.7, 3.1),
             volume: 100,
             image: UIImage(named: "warka")!),
        Beer(name: "Coors Light Lager Beer",
             country: "🇺🇸",
             type: .light,
             prices: (1.7, 2.0, 3.5),
             volume: 100,
             image: UIImage(named: "CoorsLightLagerBeer")!),
        Beer(name: "Miller Lite Lager Beer",
             country: "🇺🇸",
             type: .light,
             prices: (1.7, 2.3, 3.2),
             volume: 100,
             image: UIImage(named: "MillerLiteLagerBeer")!),
        Beer(name: "Corona Extra",
             country: "🇲🇽",
             type: .light,
             prices: (1.7, 2.4, 3.6),
             volume: 100,
             image: UIImage(named: "CoronaExtra")!),
        Beer(name: "Michelob ULTRA",
             country: "🇺🇸",
             type: .dark,
             prices: (1.7, 3.6, 4.5),
             volume: 100,
             image: UIImage(named: "MichelobULTRA")!),
        Beer(name: "Modelo Especial",
             country: "🇲🇽",
             type: .light,
             prices: (1.6, 2.5, 3),
             volume: 100,
             image: UIImage(named: "ModeloEspecial")!),
        Beer(name: "Guinness Draught",
             country: "🇮🇪",
             type: .dark,
             prices: (1.5, 2.5, 3.7),
             volume: 100,
             image: UIImage(named: "GuinnessDraught")!),
        Beer(name: "Heineken Lager",
             country: "🇳🇱",
             type: .light,
             prices: (1.5, 2.5, 3.7),
             volume: 100,
             image: UIImage(named: "HeinekenLager")!),
        Beer(name: "Corona Premier",
             country: "🇲🇽",
             type: .light,
             prices: (1.5, 2.7, 3),
             volume: 100,
             image: UIImage(named: "CoronaPremier")!),
        Beer(name: "Bud Light Platinum",
             country: "🇺🇸",
             type: .light,
             prices: (1.5, 2.5, 3),
             volume: 100,
             image: UIImage(named: "BudLightPlatinum")!),
        Beer(name: "Stella Artois",
             country: "🇧🇪",
             type: .light,
             prices: (1.5, 2.5, 3),
             volume: 100,
             image: UIImage(named: "StellaArtois")!)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Beer Heaven"
//        print(beerVolumes.count)
        completeBeers()

    }

    
    
    //Выводит номер каждого тега кнопок  beerButtons
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        guard let sender = sender as? UIButton,
              let destinationController = segue.destination as? BeerDetailsViewController else { return }
        let beerIndex = sender.tag
        
        
        destinationController.beerIndex = beerIndex
        destinationController.beer = beers[beerIndex]
        destinationController.parentController = self
    }
    

    func completeBeers() {
        for index in 0..<beerNames.count {
            beerNames[index].text = "\(beers[index].country) \(beers[index].name)"
            
            beerVolumes[index].text = "Leftover beer: \(beers[index].volume) l"
        }
    }

    
    
    
}

