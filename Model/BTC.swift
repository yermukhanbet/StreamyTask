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
    var price: String
    var volume: String
    static var saved = BTC()
    static var BTCPairs: [String] = []
    static var BTClist: [BTC] = []
    init(name: String, price: String, volume: String){
        self.name = name
        self.price = price
        self.volume = volume
    }
    override init(){
        self.name = ""
        self.price = ""
        self.volume = ""
    }
     required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
