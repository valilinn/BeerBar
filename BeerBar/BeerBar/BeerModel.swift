//
//  BeerModel.swift
//  BeerBar
//
//  Created by Валентина Лінчук on 25/06/2023.
//

import Foundation

struct Beer {
    let name: String
    let country: String
    let type: BeerType
    let prices: (Decimal, Decimal, Decimal)
    var volume: Decimal
}

enum BeerType {
    case light, dark
}
