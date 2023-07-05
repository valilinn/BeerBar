//
//  BarManagerDelegate.swift
//  BeerBar
//
//  Created by Валентина Лінчук on 05/07/2023.
//

import Foundation

protocol BarManagerDelegate: AnyObject {
    func beersWasUpdated()
}

extension BarManagerDelegate {
    func beersWasUpdated() { }
}
