//
//  BTC.swift
//  StreamyTask
//
//  Created by Yessen Yermukhanbet on 11/9/20.
//  Copyright © 2020 Yessen Yermukhanbet. All rights reserved.
//

import UIKit

class BTC: NSObject {
    var name: String
    var price: Double
    var volume: Double
    static var saved = BTC()
    static var BTCPairs: [String] = []
    static var BTClist: [BTC] = []
    init(name: String, price: Double, volume: Double){
        self.name = name
        self.price = price
        self.volume = volume
    }
    override init(){
        self.name = ""
        self.price = 0
        self.volume = 0
    }
     required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
