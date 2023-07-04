//
//  BarManager.swift
//  BeerBar
//
//  Created by Валентина Лінчук on 03/07/2023.
//

import Foundation
import UIKit

class BarManager {
    
    public static var sharedInstance = BarManager()
    
    private init() { }
    
    private let initialBeers: [Beer] = [
        Beer(name: "Tyskie",
             country: "🇵🇱",
             type: .light,
             prices: (1.3, 2.3, 3.3),
             volume: 10,
             image: UIImage(named: "tyskie")!),
        Beer(name: "Бердичівське",
             country: "🇺🇦",
             type: .light,
             prices: (1.0, 2.7, 3.6),
             volume: 12,
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
    
    var beers: [Beer] = []
    
    var totalSalary: Decimal = 0
    var todaySalary: Decimal = 0
    
    func pricesForBeer(with index: Int) -> (Decimal, Decimal, Decimal) { beers[index].prices }
    
    func buyBeer(with index: Int, volume: Decimal) {
        beers[index].volume -= volume
        
        switch volume {
        case 0.33:
            todaySalary += beers[index].prices.0
        case 0.5:
            todaySalary += beers[index].prices.1
        case 1.0:
            todaySalary += beers[index].prices.2
        default:
            return
        }
    }
    
    func newDay() {
        totalSalary += todaySalary
        todaySalary = 0
    }
    
    func resetAll() {
        totalSalary = 0
        todaySalary = 0
        beers = initialBeers
    }
    
}
